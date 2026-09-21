# Portfolio redesign

Built from mainline commit `9685986af547505d1fb1066eb238602eb85407ec`, using the supplied **Portfolio website design (1).zip** as the visual reference. No existing redesign branches were used.

## Design and content

The implementation keeps Jekyll and GitHub Pages. It translates the prototype's charcoal background, blue accents, Instrument Serif / DM Sans / JetBrains Mono typography, hero grid and glow, profile strip, eight numbered homepage sections, bordered grids, publication rows, category filters, skill groups, leadership statistics, talks by year, and entrance/scroll animations into Liquid, CSS, and a small vanilla JavaScript enhancement.

All 17 mainline collection records retain their full text and metadata. The homepage biography and research text live in `portfolio-biography.html` and `portfolio-research.html` includes. Archive introductions, publication explanations, research affiliations, and awards are retained in their respective content includes. All 60 skills, three languages, six educational credentials, and 14 awards are preserved. Original images and downloads are retained.

Prototype-only sample credentials, affiliations, publications, students, availability claims, skill ratings, and employment histories were not treated as biographical evidence. All 60 skills use the prototype's row-and-bar motif, with outlined bars explicitly labeled as unspecified proficiency. Placeholder mentorship cards are populated with documented research-team leadership and reading-group participation.

The fidelity refinement restores the 160px circular color portrait and blue glow, SVG icons, serif profile heading, spring entrance motion, staggered reveals, navigation fade, compact footer with a maintained last-updated date, and award highlights on the homepage. Typography and spacing follow the reference more closely. Readable contrast and room for the complete real content remain deliberate differences; this is not a pixel-identical rendering of the prototype's sample content.

## Behavior and accessibility

- Native links and disclosures work without JavaScript; project filtering enhances the complete list.
- Mobile navigation includes Contact, closes on selection/outside click/Escape, and restores focus on Escape.
- Reduced motion, visible keyboard focus, skip navigation, print styling, readable contrast, and responsive embeds are supported.
- The broken collision between two talks is fixed: the sustainability lecture remains at `/talks/ESRM300`, and the documentary has `/talks/plastic-documentary`.
- Buttons with known URLs become normal links. Metadata badges are non-interactive text. Resources without a recorded URL are explicitly marked unavailable.
- Existing resume and social/profile destinations are preserved. Dates and historical assertions reflect the supplied mainline content, not independently updated biographical research.
- Detail pages retain sharing controls, optional reading time, and related-post navigation where configured.

## Updating content

Edit the existing `_projects`, `_publications`, `_teaching`, `_leadership`, and `_talks` Markdown records. `summary`, `portfolio_category`, `tags`, `codeurl`, and `videourl` power the overview components; the complete document body stays on its detail route. Edit `_data/portfolio_skills.json` for the grouped skills, languages, and education.

Shared presentation lives in `_layouts/portfolio*.html`, `_includes/portfolio*.html`, `assets/css/portfolio.css`, and `assets/js/portfolio.js`. The application requires no new JavaScript packages or React runtime.

Update `_data/portfolio_ui.yml` when publishing site changes. The footer uses this maintained date rather than treating every build as a content edit.

## Validation

```sh
bundle exec jekyll build --destination local/preview
bundle exec ruby scripts/verify_portfolio.rb local/preview
```

The verifier compares the original mainline record text, metadata, biography, research statements, skill list, awards, and assets; checks duplicate routes and headings; and validates local page, image, script, stylesheet, download, and anchor destinations. Its optional second argument changes the baseline Git revision when intentional content updates require it.

For a standard preview, use `bundle exec jekyll serve --host 127.0.0.1 --port 4173`. GitHub Pages deployment remains unchanged. This redesign does not deploy itself.
