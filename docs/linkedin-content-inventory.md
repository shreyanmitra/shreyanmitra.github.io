# LinkedIn export vs other-model checklist

Inventory only. No portfolio edits were made from this document.

Sources:

- Official LinkedIn archive `Basic_LinkedInDataExport_09-22-2026` (Profile, Positions, Education, Projects, Skills, Publications, Honors, Languages, Volunteering, TestScores). Messages, ads, jobs, and learning files were ignored.
- Other model: `Portfolio_Page_by_Page_Content_Checklist.docx` (baseline commit `6385b6e` plus a local stash). Extracted by [checklist inventory](5e5f3467-cde2-4fd8-83ad-46574e8ffba3).
- Current site collections and `_data/portfolio_skills.json`.

Today’s date for this inventory: 22 Sep 2026.

---

## 1. What the LinkedIn export shows is missing from the site

These are export-backed gaps. They override the earlier public-profile scrape where they disagree.

### Industry roles

| Role (export) | Dates | On site | Notes from export |
|---|---|---|---|
| **CEO and Founder, valid8 AI** | Oct 2025–present | Absent | Current. Public LinkedIn had said CTO; the export title is CEO and Founder. AI SAST / agentic cybersecurity. The other model **forbade** adding Valid8 anywhere. |
| **Software Engineer, AWS** | Jun 2026–Sep 2026 | Absent | Export end date is Sep 2026 (not “present”). Title is Software Engineer, not intern. Long shipped-work write-up: A2UI, MCP schedule engine, data-lake query, ACP connector, incident analysis, 36 packages, 225 CRs, Bedrock/CDK/Fargate/Athena/etc. |
| **Backend Engineer, Conduit** | Mar 2026–Jun 2026 | Absent | Title is Backend Engineer, not intern. Description empty. |
| **Machine Learning Engineer, AWS** | Jun 2025–Sep 2025 | Absent | Agentic assistant, $75M+ mitigation estimate, 18k-user internal tools. |

### Research and earlier roles

| Role (export) | Dates | On site |
|---|---|---|
| Researcher, UC Riverside Wang Lab | Jul 2022–Jan 2023 | Absent (ML + mass spec / drug discovery) |
| Researcher, ASDRP | Jun 2022–Aug 2022 | Absent (ML for agriculture) |
| Azure intern / BitProject BitHeroes, UC Davis | Jun 2020–Aug 2020 | Azure skill only |
| Syndicated columnist, Medium | Aug 2019–Aug 2023 | About mentions Medium; no writing record |
| Chapter President, Model UN | Aug 2022–Jun 2023 | Absent |
| Founding President, WAGE | 2019–2023 | Geography awards only |
| Research participant, College Board | 2021–2023 | Absent |
| City of Santa Clara Library Teen Council | 2020–2022 | Absent |

COSMOS, TEDx, Mission College TA, AIEA, ASUW, PTSA, SCUSD task force, and Choitee/XAI papers are already on the site.

### Export-backed extras that are not full “jobs”

- **XAISuite as a product:** Projects.csv lists “XAISuite Library” (84k+ downloads) and “The XAISuite Project.” Site only footnotes XAIPipe/XAISuite under the explainability paper.
- **Volunteering:** Light and Salt is on the site. Export also has **Exceptional Care for Children** (greeting cards for terminally ill children) and **Operation Gratitude** (care packages).
- **Languages:** Hindi, elementary. Site: Bengali · French · English.
- **Test scores:** SAT 1590 (Dec 2021).
- **Education notes not on the site:** UW course list; Mission College course list; 18 AP scores; senior standing / direct Allen School admit; Physics II at Ventura CCD; UC Scout AP Human Geography A+.
- **Honors not on the site:** WordMaster Challenge national 3rd (2017); AP Scholar with Honor (superseded by Distinction). National Merit and Presidential Scholarship Semifinalist are on the site but **not** in the LinkedIn honors export.
- **Publications in the export that are not site publication cards:** four Medium plastic-policy essays (2020–2021); Medium “The Power of AI, Without the Code” (2023); *Geography Bee Simplified* listed as **editor/reviewer**, not author. TEDx, StudentCam, and both XAI arXiv papers are already represented. The 2026 GeoAI and bacteriophage papers from the public scrape are **not** in this export.

### Skills in the export that the site inventory lacks

Agentic Architecture, Agentic Workflows, Agentic AI, MCP, WebMCP, A2UI, AI Orchestration, ACP, Strands SDK, Prompt Engineering, Amazon Bedrock, AWS Lambda, Amazon S3, DynamoDB, SQS, Redshift, API Gateway, OpenSearch Serverless, ECS, CloudFormation, OpenTelemetry, Docker, Zod, Data Lakes, Data Center Infrastructure, Patent Preparation, SHAP, LIME, GPT-4, RAG (RAG is on the WebAssistant card only).

Site already covers a large CS/ML/languages set (Python, Java, PyTorch, Azure, Kubernetes, etc.).

### Already on the site, but stale vs the export

- Hero still says student researcher. Headline in the export still says “SDE @ AWS” even though the SDE position ended Sep 2026.
- ASUW on LinkedIn ended Jun 2025 and cites the Odegaard 24/7 bill / Oversight. The site still reads current and lists four committees.
- LinkedIn About still says “seeking internships,” which is stale relative to the 2025–2026 industry roles.

CESA founder and Husky Cricket president appear in Education activities, not Positions. Both are already on the site.

---

## 2. What the other model said to add

Do not treat this section as a build list. It is a record of that document’s asks.

### New surfaces

- Experience nav item between Projects and Talks → `/experience/`.
- Entire **Experience** page with intro copy and **four placeholder cards** (bodies: “Details forthcoming.”):
  1. AWS Software Development Engineer **Intern**, Jun–Sep 2026
  2. Conduit Backend Engineer **Intern**, Mar–Jun 2026
  3. AWS Machine Learning Engineer Intern, Jun–Sep 2025
  4. UW CSE 311 TA (dates forthcoming), also duplicated on Teaching
- Headshot file swap to `images/headshotportfolio.png`.
- Author name / LinkedIn username corrections (likely already true on the current site).

### Projects

- **Eight full cards** with detail pages: ATLAS Dynamic Tooling, EasyDS, Hallucina, Market Evolution, Petridish (`LLM-RL` repo), PromptInjectionFiler, Robot Fleet Prioritization System, XAIPipe. Six of those cards share the date **4 May 2026**.
- **More Projects** disclosure: exactly 24 rows (16 GitHub links + 8 unlinked names with “Details forthcoming”).
- Unlinked names: Resume Knowledge Base, Spaceship, Terminal-NL, Control, Explainable Repository, Nonlinear Memory, Quantum Messaging, Quantum XAI. The doc itself warned these have no public URLs.
- Other Projects: only link fixes for XAIPipe/XAISuite, CandyLLM, Hallucina.
- **Do not add Valid8** or any valid8-* repo.
- **Skill Cloud unchanged** — the other model added no skills.

### Explicitly not added by that model

No new publications, leadership, talks (except a Plastic Documentary URL slug), resume copy, About body copy, Codex copy, or Valid8.

---

## 3. Overlay: other-model asks on top of the export

### Supported by both (role exists; other model under-specified it)

| Other-model item | Export reality |
|---|---|
| AWS Jun–Sep 2026 card | Yes, but title is **Software Engineer**, not Intern, and the export has a full achievement write-up (not “Details forthcoming”). |
| Conduit Mar–Jun 2026 card | Yes, but title is **Backend Engineer**, not Intern, and the export has **no** description. |
| AWS ML Engineer Jun–Sep 2025 card | Yes, and the export already has the three bullets the other model left blank. |
| XAIPipe / XAISuite as a project | Yes — Projects.csv and the 84k-download library. Site still only footnotes it. |
| Headshot / name / LinkedIn URL | Chrome, not LinkedIn content. |

### In the other-model checklist, **not** in the LinkedIn export

Treat as stash/GitHub/Codex inventory, not LinkedIn-backed:

- Entire **CSE 311 TA** role (Experience + Teaching).
- Eight full project cards except the XAISuite/XAIPipe line (ATLAS, EasyDS, Hallucina, Market Evolution, Petridish, PromptInjectionFiler, Robot Fleet).
- 24-row More Projects catalog, including the eight unlinked private/quantum names.
- CandyLLM, Chesster, Equicode, LeaseIt, and the rest of that GitHub list.
- Experience **page** as a new IA (the export has positions; it does not require that URL).
- Empty “Details forthcoming” bodies for roles that the export already describes.

### In the LinkedIn export, **omitted or contradicted** by the other model

This is the important overlay: content the export supports that the other model told you **not** to add, or got wrong.

| Export-backed item | Other-model stance |
|---|---|
| **valid8 AI, CEO and Founder (current)** | Explicit ban: no Valid8 on Projects, More Projects, or a startup section. |
| AWS SDE **Software Engineer** + full bullets | Downgraded to intern + empty placeholder. |
| Conduit **Backend Engineer** | Relabeled intern + empty placeholder. |
| AWS ML intern bullets | Placeholder only. |
| UC Riverside, ASDRP, Azure/BitProject | Not in the Experience four-card list. |
| Medium column + four plastic essays + XAISuite Medium post | “Do not add publication content.” |
| Hindi; SAT 1590; extra volunteering; AP/UW course notes; WordMaster | Skill Cloud / honors / teaching left unchanged. |
| Large AWS / agentic / MCP / Bedrock skill set | “The saved state does not add or remove Skill Cloud content.” |

### Namesake papers

The 2026 Davis GeoAI and West Point bacteriophage papers from the earlier public scrape are **absent from the official Publications.csv**. Do not add them.

---

## 4. Compact add-list if the site is meant to catch up to LinkedIn

Highest value, export-backed, and missing today:

1. valid8 AI (CEO and Founder, current) — other model excluded this on purpose.
2. AWS Software Engineer (Jun–Sep 2026) with the export write-up.
3. AWS Machine Learning Engineer (Jun–Sep 2025) with the export bullets.
4. Conduit Backend Engineer (Mar–Jun 2026), title only until a description exists.
5. XAISuite / XAIPipe as a first-class project (downloads + paper).
6. UC Riverside Wang Lab and ASDRP research roles.
7. Skill cluster: AWS, Bedrock, MCP, agentic AI, Docker, SAST/security.
8. Hindi (elementary); optional SAT 1590; Exceptional Care / Operation Gratitude.

Leave the other model’s unlinked quantum/private names, CSE 311 (unless confirmed elsewhere), intern-title mislabels, and empty placeholders out until they are verified.
