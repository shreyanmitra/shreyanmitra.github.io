# LinkedIn export vs site — live inventory

Last refreshed: **24 Sep 2026**.

Sources:

- LinkedIn Basic export `Basic_LinkedInDataExport_09-22-2026`
- LinkedIn Complete / Part 2 `Complete_LinkedInDataExport_09-23-2026`
- Other-model checklist (historical; see §4)
- Current site collections and `_data/portfolio_skills.json`

This doc is the **current** gap list. Older “Absent” snapshots for industry roles and skills are obsolete and are not repeated as open work.

---

## 1. Closed since the original inventory (on site now)

| Item | Where |
|---|---|
| CEO and Founder, valid8 AI (Oct 2025–present) | `_experience/valid8-ceo-founder.md` |
| Software Engineer, AWS (Jun–Sep 2026) + full export write-up | `_experience/aws-software-engineer.md` |
| Machine Learning Engineer, AWS (Jun–Sep 2025) + bullets | `_experience/aws-machine-learning-engineer.md` |
| Backend Engineer, Conduit (Mar–Jun 2026) — page exists; body still placeholder | `_experience/conduit-backend-engineer.md` |
| Experience archive + home section | `/experience/`, `#experience` |
| All **86** LinkedIn `Skills.csv` entries | `_data/portfolio_skills.json` (+ extra skills from repos) |
| SAT 1590 | `_includes/portfolio-awards.html` |
| CSE 311 TA (other-model / not LinkedIn) | `_teaching/uw-cse-311-ta.md` |
| *Geography Bee Simplified* editor/co-write credit | `_includes/portfolio-publication-notes.html` (not a publication card) |
| “18 APs” count | awards strip under AP Scholar with Distinction |

Already present before that inventory wave (unchanged): AIEA, ASUW, PTSA, SCUSD task force, Light and Salt, CESA, Husky Cricket, COSMOS, TEDx, Mission College TA, Choitee, XAI arXiv papers, National Merit Scholar, Presidential Scholarship Semifinalist.

---

## 2. Still open — export-backed gaps

### Research / early roles (no site records)

| Role (export) | Dates | Notes |
|---|---|---|
| Researcher, UC Riverside Wang Lab | Jul 2022–Jan 2023 | ML + mass spec / drug discovery |
| Researcher, ASDRP | Jun 2022–Aug 2022 | ML for agriculture |
| Azure intern / BitProject BitHeroes, UC Davis | Jun 2020–Aug 2020 | Azure skill only on site |
| Syndicated columnist, Medium | Aug 2019–Aug 2023 | No role card; Medium URL unset in `_config.yml`; bio does not mention Medium |
| Chapter President, Model UN | Aug 2022–Jun 2023 | |
| Founding President, WAGE | 2019–2023 | Geography awards only |
| Research participant, College Board | 2021–2023 | |
| City of Santa Clara Library Teen Council | 2020–2022 | |

### Projects

- **XAISuite / XAIPipe as a first-class project** — no project card. The Other Projects dropdown was removed. Code links remain on the explainability paper. Export: “XAISuite Library” (84k+ downloads) + “The XAISuite Project.”

### Volunteering / languages / honors

- **Exceptional Care for Children** (greeting cards for terminally ill children) — not on site
- **Operation Gratitude** (care packages) — not on site
- **Hindi**, elementary — languages are Bengali · French · English only
- **WordMaster Challenge** national 3rd (2017) — not in awards
- **AP Scholar with Honor** — optional (superseded by Distinction on site)
- **PVSA gold** — site shows a single medal; a Share post claims a **second** gold for Light and Salt

### Publications (optional cards)

Export has, as cards the site lacks: four Medium plastic-policy essays (2020–2021); Medium “The Power of AI, Without the Code” (2023). TEDx, StudentCam, and both XAI arXiv papers are already represented. Substack hub is linked; the specific “Beginner’s Brief Guide to Machine Learning Explainability” article is not a card.

Do **not** add the 2026 GeoAI / bacteriophage papers from the old public scrape — they are absent from `Publications.csv`.

### Education notes (mostly absent)

UW course list; Mission College course list; individual AP scores; senior standing / direct Allen School admit; Physics II at Ventura CCD; UC Scout AP Human Geography A+. (AP count “18” is on awards.)

### Conduit description

Experience page exists; LinkedIn description is empty → site body remains “Details forthcoming.”

---

## 3. On site but stale vs LinkedIn

| Issue | Evidence |
|---|---|
| Hero / bio still “student researcher” | `_config.yml` bio; home/about copy |
| Experience heading “Roles & Internships” | Home `#experience`, `/experience/` — odd next to Founder + Software Engineer titles |
| ASUW reads current | `_leadership/ASUWSenator.md`: present tense, no `finished`, four committees; LinkedIn ended Jun 2025 and cites Odegaard 24/7 / Oversight |
| `finished` dates not shown in list UI | `portfolio-row` only renders `item.date` (start) |
| LinkedIn Profile headline / About | Still “SDE @ AWS” / “seeking internships” in the **export** — LinkedIn-side stale; not mirrored as “seeking internships” on the site |

---

## 4. Other-model checklist (historical)

Record only — not a build list. That doc wanted intern-titled empty Experience cards, eight May-2026 project cards, a 24-row More Projects list, no Valid8, and an unchanged skill cloud. The site diverged: Valid8 and real AWS titles were added; skills were expanded; many GitHub projects were filled from repos.

CSE 311 TA and the private/quantum placeholder names remain non-LinkedIn items.

---

## 5. Part 2 Complete export extras

New file types only (Learning, Verifications, Shares, Jobs, Connections, endorsements). No new Positions/Projects/Honors/Skills rows vs Part 1.

- Learning: 144 watched, **0 completed** — not credentials
- Verifications: AWS work + UW education — confirmation only
- Shares: second PVSA gold claim; Substack XAI beginner article; AWS ML summer restatement

---

## 6. Compact remaining add-list

1. XAISuite / XAIPipe first-class project card  
2. UC Riverside Wang Lab + ASDRP (+ optional BitProject role)  
3. Hindi (elementary)  
4. Model UN, WAGE, College Board participant, Library Teen Council, Medium columnist (as role or writing record)  
5. Exceptional Care + Operation Gratitude; WordMaster; optional 2× PVSA wording  
6. Optional Medium / Substack publication cards  
7. Fix stale copy: ASUW end date + Odegaard bill; hero “student researcher”; Experience “Internships” label; show role end dates in rows  

**Not gaps:** LinkedIn skills (86/86); industry experience pages (except Conduit body); SAT 1590; Geography Bee credit in publication notes.
