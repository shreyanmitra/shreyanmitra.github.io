---
layout: portfolio-archive
title: "Publications"
permalink: /publications/
author_profile: false
section: publications
section_index: '02'
display_title: 'Papers & <em>Research</em>'
subtitle: "Explanatory systems, reliable language models, and computational modeling."
---

<section class="container archive-content">
{% for item in site.publications reversed %}{% include portfolio-row.html item=item heading='h2' %}{% endfor %}
<div class="prose">{% capture notes %}{% include portfolio-publication-notes.html %}{% endcapture %}{{ notes | markdownify }}</div>
</section>
