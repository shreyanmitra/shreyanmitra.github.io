---
layout: portfolio-archive
title: "Experience"
permalink: /experience/
author_profile: false
section: experience
section_index: '03.5'
display_title: 'Roles &amp; <em>Internships</em>'
subtitle: "Industry and startup experience across software engineering, machine learning, and founding work."
---

<section class="container archive-content">
{% assign preferred = 'Startup,Industry' | split: ',' %}
{% for category in preferred %}<h2 class="group-label">{{ category }}</h2>{% assign items = site.experience | where: 'portfolio_category', category | sort: 'date' | reverse %}{% for item in items %}{% include portfolio-row.html item=item full=true %}{% endfor %}{% endfor %}
</section>
