---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: true
---

This page was created to include personal coding projects not associated with my research. For code I wrote as part of larger research projects go to the 'Publications' tab. Then, for each listing, you will be able to download the project code.


{% include base_path %}

{% for post in site.projects reversed %}
  {% include archive-single.html %}
{% endfor %}
