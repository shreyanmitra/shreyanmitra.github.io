---
layout: portfolio-archive
title: "Leadership & Awards"
permalink: /leadership/
author_profile: false
section: leadership
section_index: '05'
display_title: 'Service & <em>Community</em>'
subtitle: "Below, you will find my leadership experiences and awards. For sake of brevity, not everything is included."
---

<section class="section section-compact"><div class="container"><div class="stats-grid">
<div class="stat-card splat"><span class="stat-number">30+</span><p>CESA members</p><small>Computing for social impact</small></div>
<div class="stat-card splat" style="--order:1"><span class="stat-number">~1,000</span><p>Students represented</p><small>UW student senate</small></div>
<div class="stat-card splat" style="--order:2"><span class="stat-number">5–6</span><p>Fellow researchers</p><small>AIEA research team</small></div>
<div class="stat-card splat" style="--order:3"><span class="stat-number">30+</span><p>Schools connected</p><small>SCUSD sustainability</small></div>
</div></div></section>
<section class="container archive-content">{% assign categories = 'Research leadership,University,Community' | split: ',' %}{% for category in categories %}<h2 class="group-label">{{ category }}</h2>{% for item in site.leadership reversed %}{% if item.portfolio_category == category %}{% include portfolio-row.html item=item full=true %}{% endif %}{% endfor %}{% endfor %}
<div class="prose">{% include portfolio-awards.html %}</div></section>
