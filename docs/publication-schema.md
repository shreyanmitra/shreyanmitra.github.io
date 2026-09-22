# Publication front matter

A publication page is two parts. `_layouts/portfolio-detail.html` builds the chrome — back link, title, date, venue, recommended citation, paper and code buttons, "explore more publications", sharing. `_includes/portfolio-publication-detail.html` builds the body from the front matter described below.

The body of the Markdown file is a single line:

```liquid
{% include portfolio-publication-detail.html %}
```

Every block is optional. Omit a key and its panel, row, or line disappears; no placeholder is emitted.

## Chrome keys

These are read by the layout and by the cards and rows that preview the record elsewhere on the site.

| Key | Purpose |
| --- | --- |
| `title`, `date`, `collection`, `permalink` | Required by Jekyll and the routing checks |
| `venue`, `location` | Shown under the title |
| `citation` | Rendered as "Recommended citation" |
| `paperurl`, `codeurl` | Buttons below the body; `codeurl` also surfaces on homepage rows |
| `excerpt` | Legacy Academic Pages summary, retained for feeds |
| `summary` | One-line description used by homepage rows and cards |
| `portfolio_category` | Badge text, e.g. `Conference`, `Poster`, `Working paper` |
| `icon` or `header.teaser` | Optional image beside the title; bare filenames resolve against `/images/` |

## Body keys

### `glance` — the "At a Glance" panel

```yaml
glance:
  venue_tags: ["ICPRAI", "Arxiv"]   # omit to render a single "-"
  status: "Working Paper"
  part_of: ["ML Robustness"]        # omit to drop the row
  topic: ["Explainability"]
  associated_with:
    - name: "AIEA Lab"
      url: "https://aiea-lab.github.io"   # omit url to render a plain tag
      logo: "/files/AIEALogo.png"         # optional
  versions: 3
  has_code: "Yes"
  has_dataset: "No"
  separate_papers: "No"
```

### `quick_access` — the "Quick Access Buttons" panel

A list of labels. An entry with a `url` becomes a link; an entry without one renders as struck-through and unavailable.

```yaml
quick_access:
  - label: "Code"
    url: "https://github.com/shreyanmitra/XAIPipe"
  - label: "Slides"
```

### `preview` — the "Paper Preview" panel

`excerpt_note` and `citation_note` are the lines that explain where the quoted text came from. `code` and `datasets` take the same shape as `quick_access`.

```yaml
preview:
  excerpt_note: "None provided for current version. Taking excerpt from most recent published version"
  excerpt: "Explanatory systems make the behavior of…"
  citation_note: "None provided for current version…"
  citation: "Mitra, Shreyan and Gilpin, Leilani. (2023)…"
  code:
    - label: "XAIPipe"
      url: "https://github.com/shreyanmitra/XAIPipe"
  datasets:
    - label: "Hallucination Dataset on HuggingFace"
```

### `history` — the "History" panel

Set `history: {}` to render the panel with "No previous versions found".

```yaml
history:
  versions:
    - "<u>The XAISuite framework…</u> (preprint Arxiv 2023)"
  archived_code:
    - label: "XAISuite"
      url: "https://github.com/11301858/XAISuite"
```

## Verification

`scripts/verify_portfolio.rb` treats the rendered page as the content contract for records whose body is this include: every word the pre-redesign source carried must still appear in the rendered article, counting repeats. Records that still hold their prose inline are additionally checked for exact source equality.
