---
title: "Let's Agree to Disagree: Towards a Solution to the Disagreement Problem in Explainability"
collection: publications
permalink: /publication/lets-agree-to-disagree
excerpt: <i>Published in ICPRAI and Arxiv</i><br><br>2 papers (4 total versioned papers). <br> Explanatory systems give us a peek under the hood of blackbox ML models. This collection encompasses my work analyzing differences between explanatory systems, quantifying these differences, and integrating the resulting metrics into machine learning pipelines.<br><br><button onclick="location.href='https://github.com/shreyanmitra/XAIPipe'" type="button">Code</button> <button>Paper</button> <button disabled>Slides</button> <button disabled>Video</button> <button disabled>Talk</button> <button disabled>Datasets</button>
date: 2024-11-17
venue: 'ICPRAI Conference Proceedings'
paperurl: 'https://arxiv.org/pdf/2311.10811'
citation: 'Mitra,S and Gilpin, L. (2023). &quot;A novel post-hoc explanation comparison metric and applications&quot; <i>ICPRAI Conference Proceedings, 2024</i>. 1(3).'
portfolio_category: "Conference"
summary: "2 papers (4 total versioned papers). Comparing explanatory systems, quantifying their differences, and integrating the resulting metrics into machine learning pipelines."
codeurl: "https://github.com/shreyanmitra/XAIPipe"
glance:
  venue_tags: ["ICPRAI", "Arxiv"]
  status: "Working Paper"
  part_of: ["ML Robustness", "ML Accessibility"]
  topic: ["Explainability"]
  associated_with:
    - name: "AIEA Lab"
      url: "https://aiea-lab.github.io"
      logo: "/files/AIEALogo.png"
  versions: 3
  has_code: "Yes"
  has_dataset: "No"
  separate_papers: "No"
quick_access:
  - label: "Code"
    url: "https://github.com/shreyanmitra/XAIPipe"
  - label: "Paper"
    url: "https://arxiv.org/pdf/2311.10811"
  - label: "Slides"
  - label: "Video"
  - label: "Talk"
  - label: "Datasets"
preview:
  excerpt_note: "None provided for current version. Taking excerpt from most recent published version"
  excerpt: "Explanatory systems make the behavior of machine learning models more transparent, but are often inconsistent. To quantify the differences between explanatory systems, this paper presents the Shreyan Distance, a novel metric based on the weighted difference between ranked feature importance lists produced by such systems. This paper uses the Shreyan Distance to compare two explanatory systems, SHAP and LIME, for both regression and classification learning tasks. Because we find that the average Shreyan Distance varies significantly between these two tasks, we conclude that consistency between explainers not only depends on inherent properties of the explainers themselves, but also the type of learning task. This paper further contributes the XAISuite library, which integrates the Shreyan distance algorithm into machine learning pipelines."
  citation_note: "None provided for current version. Taking citation from most recent published version"
  citation: 'Mitra, Shreyan and Gilpin, Leilani. (2023). &quot;A novel post-hoc explanation comparison metric and applications&quot; <i>ICPRAI Conference Proceedings, 2024</i>. 1(3).'
  code:
    - label: "XAIPipe"
      url: "https://github.com/shreyanmitra/XAIPipe"
history:
  versions:
    - "<u>The XAISuite framework and the implications of explanatory system dissonance</u> (preprint Arxiv 2023)"
    - "<u>A novel post-hoc explanation comparison metric and applications</u> (preprint Arxiv 2023 and published ICPRAI 2024)"
  archived_code:
    - label: "XAISuite"
      url: "https://github.com/11301858/XAISuite"
---

{% include portfolio-publication-detail.html %}
