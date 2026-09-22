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

<section class="container archive-content">
{% assign preferred = 'Research leadership,University,Community' | split: ',' %}
{% assign extras = '' %}
{% for item in site.leadership %}{% unless preferred contains item.portfolio_category %}{% assign extras = extras | append: item.portfolio_category | append: '|' %}{% endunless %}{% endfor %}
{% assign extra_categories = extras | split: '|' | compact | uniq %}
{% for category in preferred %}<h2 class="group-label">{{ category }}</h2>{% for item in site.leadership reversed %}{% if item.portfolio_category == category %}{% include portfolio-row.html item=item full=true %}{% endif %}{% endfor %}{% endfor %}
{% for category in extra_categories %}{% if category != '' %}<h2 class="group-label">{{ category }}</h2>{% for item in site.leadership reversed %}{% if item.portfolio_category == category %}{% include portfolio-row.html item=item full=true %}{% endif %}{% endfor %}{% endif %}{% endfor %}
<div class="prose">{% include portfolio-awards.html %}</div></section>
