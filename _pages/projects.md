---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: true
---

This page was created to include personal coding projects not associated with my research.


{% include base_path %}

{% for post in site.projects reversed %}
  {% include archive-single.html %}
{% endfor %}
