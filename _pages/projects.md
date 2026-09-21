---
layout: portfolio-archive
title: "Projects & Skills"
permalink: /projects/
author_profile: false
section: projects
section_index: '03'
display_title: 'Work & <em>Capabilities</em>'
subtitle: "Research tools, applications, and creative experiments — alongside the skills behind them."
---

<section class="container archive-content">
<div class="prose">{% capture notes %}{% include portfolio-project-notes.html %}{% endcapture %}{{ notes | markdownify }}</div>
<div class="filters" role="group" aria-label="Filter projects by category" data-filter-group="project-results" data-status="project-count" hidden>{% assign filters = 'All,AI & Tools,Libraries,Applications' | split: ',' %}{% for filter in filters %}<button type="button" data-filter="{{ filter | escape }}" aria-pressed="{% if forloop.first %}true{% else %}false{% endif %}">{{ filter }}</button>{% endfor %}</div>
<p id="project-count" class="filter-status" role="status" aria-live="polite">{{ site.projects.size }} projects shown</p>
<div class="cell-grid" id="project-results">{% for item in site.projects reversed %}{% include portfolio-card.html item=item index=forloop.index0 %}{% endfor %}</div>
</section>
{% include portfolio-skills.html %}
