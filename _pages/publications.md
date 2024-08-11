---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

{% if site.author.googlescholar %}
  <div class="wordwrap">You can also find my articles on <a href="{{site.author.googlescholar}}">my Google Scholar profile</a>.</div>
{% endif %}

Click the link of each entry to see a longer description, along with links to download any slides, code, or papers. Sometimes, I have grouped multiple published papers into one listing. This can happen for multiple reasons, such as some papers being intermediate versions of another paper, or papers associated with the code or dataset used by another paper.

Wherever a listing has more than one published paper associated with it, I have specified how many published papers are represented by that listing.

{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}
