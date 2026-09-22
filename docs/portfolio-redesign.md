# Portfolio redesign

Built from mainline commit `9685986af547505d1fb1066eb238602eb85407ec`, using the supplied **Portfolio website design (1).zip** as the visual reference. No existing redesign branches were used.

## Design and content

The implementation keeps Jekyll and GitHub Pages. It translates the prototype's charcoal background, blue accents, Instrument Serif / DM Sans / JetBrains Mono typography, hero grid and glow, portrait and identity block, eight numbered homepage sections, bordered grids, publication rows, category filters, skill groups, leadership statistics, talks by year, and entrance/scroll animations into Liquid, CSS, and a small vanilla JavaScript enhancement.

All 17 mainline collection records retain their full text and metadata. The homepage biography and research text live in `portfolio-biography.html` and `portfolio-research.html` includes. Archive introductions, publication explanations, research affiliations, and awards are retained in their respective content includes. All 60 skills, three languages, six educational credentials, and 14 awards are preserved. Original images and downloads are retained.

Prototype-only sample credentials, affiliations, publications, students, availability claims, skill ratings, and employment histories were not treated as biographical evidence. All 60 skills use the prototype's row-and-bar motif, with outlined bars explicitly labeled as unspecified proficiency. Placeholder mentorship cards are populated with documented research-team leadership and reading-group participation.

The fidelity refinement restores the circular color portrait and blue glow, SVG icons, serif profile heading, spring entrance motion, staggered reveals, navigation fade, compact footer with a maintained last-updated date, and award highlights on the homepage. Typography and spacing follow the reference more closely. Readable contrast and room for the complete real content remain deliberate differences; this is not a pixel-identical rendering of the prototype's sample content.

## Visual system

The surface treatment is a dark adaptation of the research-lab palette, and blue is the only hue on top of the neutrals: institutional navy deepened to `#070a12`, `#2563eb` for filled actions, and `#7bb0ff` for accent text, icons, award markers, and featured labels. Nothing is filled with a multi-hue gradient — emphasis type, the scroll progress bar, and buttons are flat colour, and the only remaining gradients are white-alpha lighting (card sheen, grid lines, section wash) and single-hue blue glows. Display headings use Crimson Pro; DM Sans carries body copy, labels, and controls.

Two fixed layers sit behind the page: an aurora of four blue radial gradients that drifts over 34 seconds, and a masked 72px grid. Cards, the navigation bar, the identity card, the footer, filter pills, and disclosure panels are frosted translucent panels with a hairline border. `backdrop-filter` is applied only where content scrolls behind a surface — navigation, mobile menu, identity card, footer, stat and contact cards — while grid cards use translucency alone so long pages stay cheap to paint.

## Homepage arrangement

The portrait sits in the hero beside the headline rather than in a separate band below it, so the face arrives with the name and the previously empty right half of the opening screen is balanced. The identity copy that band carried — name, role, institution, short biography, and the social and CV links — now opens section `07 · About`, where it introduces education, languages, affiliations, and the narrative biography instead of restating the hero one screen after it. Every string is unchanged; the name is demoted from `h2` to `h3` because it is now subordinate to the section heading. Award highlights are enclosed in their own bordered panel so the recognitions read as credentials rather than a trailing list.

Motion is scoped to a `motion` class that a pre-paint inline script adds only when `IntersectionObserver` exists and the visitor has not requested reduced motion. Without that class nothing is hidden, so the no-JavaScript and reduced-motion paths render final-state. A load-time fallback releases any element the observer never reached. Homepage section numbers (`01`–`08`), archive `section_index` values, and the skills `03.1` marker are rendered from data that the templates already carried.

## Academic Pages surface

The primary navigation is generated from `_data/navigation.yml` again. An entry carries either a `section` (a homepage anchor), a `url` (a standalone page, optionally paired with `section` so collection records mark it active), `divider: true`, or `style: button`. `_includes/masthead.html` and `_layouts/default.html` are no longer reachable, so that file is the only place navigation is defined.

MathJax had stopped loading: it is wired through `_includes/footer/custom.html`, which `default.html` included and the replacement `portfolio.html` layout did not. The portfolio layout now includes it, so LaTeX in a record body renders again.

Cards and detail pages accept an optional `icon` — or the Academic Pages `header.teaser` — on any record. Absolute URLs and site-root paths are used as given; a bare filename resolves against `/images/`. Records without one render exactly as before.

The talk map is generated from the collection rather than from a committed Python artifact. Each `_talks` record carries `latitude` and `longitude`, and `_includes/portfolio-talkmap.html` emits the points as JSON that `assets/js/talkmap.js` draws with Leaflet over Esri's keyless dark canvas. The map sits on `/talks/`; `/talkmap.html` redirects there. The generated `talkmap/` directory, `talkmap.py`, and `talkmap.ipynb` are removed — they carried the upstream sample's Berkeley and London coordinates, not these talks. Popups are built as DOM nodes so record text is never parsed as markup, and the plain location list stays visible if Leaflet fails to load.

Publication bodies are templated. See `docs/publication-schema.md`.

Template sample content is gone: five placeholder posts, the two `_portfolio` samples and their collection, and the `markdown`, `non-menu-page`, `archive-layout-with-content`, `page-archive`, `collection-archive`, `portfolio`, `year-archive`, `category-archive`, and `tag-archive` pages. `markdown_generator` is excluded from the build rather than deleted, so the upstream notebook workflow survives without publishing `.ipynb` and `.tsv` files to the site. `_pages/terms.md` is untouched but is still unmodified upstream boilerplate describing cookies and ad networks this site does not use.

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
