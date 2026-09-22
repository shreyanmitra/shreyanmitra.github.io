# Run after `bundle exec jekyll build --destination local/preview`.
# Verifies the migration's content contract as well as generated routes/assets.
require 'yaml'
require 'date'
require 'json'
require 'open3'
require 'nokogiri'
require 'kramdown'
require 'kramdown-parser-gfm'
require 'uri'

output = ARGV[0] || 'local/preview'
baseline = ARGV[1] || '9685986af547505d1fb1066eb238602eb85407ec'
failures = []
checks = 0
check = lambda do |condition, message|
  checks += 1
  failures << message unless condition
end
source_at = lambda do |file|
  text, error, status = Open3.capture3('git', 'show', "#{baseline}:#{file}")
  raise error unless status.success?
  text.force_encoding('UTF-8')
end
split_source = lambda do |source|
  front, body = source.sub(/\A---\s*\n/, '').split(/^---\s*$\n?/, 2)
  [YAML.safe_load(front, permitted_classes: [Date, Time], aliases: true), body || '']
end
tokens = lambda do |source|
  html = Kramdown::Document.new(source, input: 'GFM').to_html
  text = Nokogiri::HTML.fragment(html).xpath('.//text()').map(&:text).join(' ')
  text.downcase.scan(/[\p{L}\p{N}]+/)
end
resolve = lambda do |route|
  file = File.join(output, URI::DEFAULT_PARSER.unescape(route.split(/[?#]/).first).sub(%r{\A/}, ''))
  [file, File.join(file, 'index.html'), "#{file}.html"].find { |candidate| File.file?(candidate) }
end

# Words the baseline carried that the candidate no longer has, counting repeats.
shortfall = lambda do |baseline, candidate|
  have = candidate.tally
  baseline.tally.each_with_object([]) do |(word, count), missing|
    missing << word if count > have.fetch(word, 0)
  end
end

collections = Dir.glob('{_publications,_projects,_teaching,_leadership,_talks,_experience}/*.{md,html}')
routes = []
collections.each do |file|
  text, error, status = Open3.capture3('git', 'show', "#{baseline}:#{file}")
  unless status.success?
    # New records added after the baseline are allowed; still require a rendered route.
    new_meta, = split_source.call(File.read(file, encoding: 'UTF-8'))
    route = new_meta['permalink']
    routes << route if route
    check.call(!resolve.call(route).nil?, "Missing collection route: #{route}") if route
    next
  end
  old_meta, old_body = split_source.call(text.force_encoding('UTF-8'))
  new_meta, new_body = split_source.call(File.read(file, encoding: 'UTF-8'))
  # Publication bodies now live in front matter and are rendered by an include,
  # so for those the rendered page rather than the source is the content contract.
  templated = new_body.match?(/\{%-?\s*include\s+portfolio-publication-detail\.html/)
  unless templated
    check.call(tokens.call(old_body) == tokens.call(new_body), "Source information changed: #{file}")
  end
  %w[title date venue location citation paperurl excerpt].each do |key|
    check.call(old_meta[key] == new_meta[key], "Metadata lost: #{file}: #{key}") if old_meta.key?(key)
  end
  route = new_meta['permalink']
  routes << route
  rendered_path = resolve.call(route)
  check.call(!rendered_path.nil?, "Missing collection route: #{route}")
  next unless rendered_path
  rendered = Nokogiri::HTML(File.read(rendered_path, encoding: 'UTF-8'))
  body_text = rendered.at_css('article.prose')&.inner_html || ''
  rendered_tokens = tokens.call(body_text)
  missing = shortfall.call(tokens.call(old_body), rendered_tokens)
  check.call(missing.empty?, "Record text lost: #{file}: #{missing.uniq.first(10).join(', ')}")
  unless templated
    check.call(rendered_tokens.join(' ').include?(tokens.call(new_body).join(' ')), "Record body absent from rendered page: #{route}")
  end
  check.call(rendered.css('h1').length == 1, "Expected one main heading: #{route}")
end
check.call(routes.uniq.length == routes.length, 'Duplicate collection permalinks')

old_about = split_source.call(source_at.call('_pages/about.md'))[1]
intro, rest = old_about.split('In recent years', 2)
research, biography = rest.split('In addition to my research', 2)
check.call(tokens.call(intro + 'In addition to my research' + biography) == tokens.call(File.read('_includes/portfolio-biography.html', encoding: 'UTF-8')), 'Biography information lost')
check.call(tokens.call('In recent years' + research) == tokens.call(File.read('_includes/portfolio-research.html', encoding: 'UTF-8')), 'Research information lost')

old_projects = split_source.call(source_at.call('_pages/projects.md'))[1]
old_skills = Nokogiri::HTML.fragment(old_projects).css('button').map { |node| node.text.strip }
skills = JSON.parse(File.read('_data/portfolio_skills.json'))
# Allow cleaned display labels for skills that existed under awkward spellings.
skill_renames = {
  'LaTex' => 'LaTeX',
  'Tumor' => 'Tumor modeling',
  'Developer Ad' => 'Developer Advocate',
  'Amazon Dynamodb' => 'Amazon DynamoDB',
  'Assistant Teaching' => 'Teaching assistant'
}
old_skills = old_skills.map { |name| skill_renames[name] || name }
new_skills = skills['groups'].flat_map { |group| group['skills'] } + skills['languages'] + skills['degrees']
check.call((old_skills - new_skills).empty?, 'A skill, language, or degree is missing')
old_awards = Nokogiri::HTML.fragment(split_source.call(source_at.call('_pages/leadership.md'))[1]).css('button').map { |node| node.text.strip }
new_awards = Nokogiri::HTML.fragment(File.read('_includes/portfolio-awards.html')).css('.tag').map { |node| node.text.strip }
check.call((old_awards - new_awards).empty?, 'An award is missing')

# Check that the redesigned presentation exposes every skill, not just the data file.
projects_doc = Nokogiri::HTML(File.read(resolve.call('/projects/'), encoding: 'UTF-8'))
check.call(projects_doc.css('.skill-name').map { |node| node.text.strip }.sort == skills['groups'].flat_map { |group| group['skills'] }.sort, 'A skill is absent from the rendered skills list')
check.call(projects_doc.css('.skill-rating').empty?, 'Unspecified proficiency should not appear as a rating')
home_doc = Nokogiri::HTML(File.read(resolve.call('/'), encoding: 'UTF-8'))
check.call(home_doc.text.include?('National Merit Scholar') && home_doc.text.include?("President's Volunteer Service Gold Medal"), 'Homepage award highlights missing')
check.call(!home_doc.at_css('footer time[datetime]').nil?, 'Footer update date missing')

# Every previously recorded external destination must remain available, including
# URLs that used to be hidden in inline button handlers.
all_rendered = Dir.glob(File.join(output, '**/*.html')).map { |file| File.read(file, encoding: 'UTF-8') }.join("\n")
new_destinations = Nokogiri::HTML(all_rendered).css('a[href]').map { |node| node['href'] }
content_sources = collections + %w[_pages/about.md _pages/projects.md _pages/publications.md _pages/leadership.md _pages/talks.html _pages/teaching.html _pages/cv.md]
content_sources.each do |file|
  old_source, _error, status = Open3.capture3('git', 'show', "#{baseline}:#{file}")
  next unless status.success?
  old_source.force_encoding('UTF-8')
  old_html = Kramdown::Document.new(split_source.call(old_source)[1], input: 'GFM').to_html
  destinations = Nokogiri::HTML.fragment(old_html).css('a[href]').map { |node| node['href'] }
  destinations += old_source.scan(/(?:location\.href\s*=\s*|window\.open\()'(https?:[^']+)'/).flatten
  destinations.select { |url| url.start_with?('https://', 'http://') }.uniq.each do |url|
    check.call(new_destinations.include?(url), "External destination lost from #{file}: #{url}")
  end
end

core = %w[/ /projects/ /publications/ /teaching/ /leadership/ /talks/ /experience/ /resume/ /sitemap/ /404.html]
core.each { |route| check.call(!resolve.call(route).nil?, "Missing primary route #{route}") }
%w[/about/ /about.html /resume].each { |route| check.call(!resolve.call(route).nil?, "Missing existing alias #{route}") }
(core + routes).each do |route|
  file = resolve.call(route)
  next unless file
  doc = Nokogiri::HTML(File.read(file, encoding: 'UTF-8'))
  check.call(doc.css('h1').size == 1, "Heading hierarchy: #{route}")
  check.call(doc.css('[id]').map { |n| n['id'] }.uniq.size == doc.css('[id]').size, "Duplicate element IDs: #{route}")
  doc.css('a[href],img[src],script[src],link[href],object[data]').each do |node|
    link = node['href'] || node['src'] || node['data']
    next if link.start_with?('http:', 'https:', 'mailto:', 'tel:', 'data:')
    # The original sitemap includes template examples; primary portfolio pages do not.
    next if route == '/sitemap/' && !link.start_with?('/')
    if link.start_with?('#')
      check.call(!doc.at_css("[id='#{link[1..]}']").nil?, "Missing anchor #{link} on #{route}")
    elsif link.start_with?('/')
      target = resolve.call(link)
      check.call(!target.nil?, "Broken local link #{link} on #{route}")
      if target && link.include?('#')
        fragment = link.split('#',2)[1]
        target_doc = Nokogiri::HTML(File.read(target, encoding: 'UTF-8'))
        check.call(!target_doc.at_css("[id='#{fragment}']").nil?, "Missing linked anchor #{link} on #{route}")
      end
    else
      check.call(!link.empty?, "Empty link on #{route}")
    end
  end
end
# Retain all mainline download and image files byte-for-byte.
assets, _, status = Open3.capture3('git', 'ls-tree', '-r', '--name-only', baseline, '--', 'files', 'images')
raise 'Could not read baseline assets' unless status.success?
assets.lines.map(&:strip).each do |file|
  original, _, asset_status = Open3.capture3('git', 'show', "#{baseline}:#{file}", binmode: true)
  current = File.file?(file) ? File.binread(file) : nil
  # Git's Windows checkout converts LF to CRLF in text assets only.
  if %w[.xml .svg .json].include?(File.extname(file))
    original = original.gsub("\r\n", "\n")
    current = current&.gsub("\r\n", "\n")
  end
  check.call(asset_status.success? && original == current, "Asset modified or lost: #{file}")
end

puts "#{checks} checks; #{collections.length} records; #{new_skills.length} skills/languages/degrees; #{new_awards.length} awards"
if failures.empty?
  puts 'PASS: content, metadata, routes, local links, and original assets preserved.'
else
  warn failures.join("\n")
  abort "FAIL: #{failures.length} checks"
end
