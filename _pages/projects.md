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

<div style="background-color: white; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 20px; padding-top: 8px; border-radius: 8px; min-width:600px;margin-bottom: 25px">
<details>
<summary><b>Other Projects</b></summary>
For convenience, projects associated with research papers or otherwise not listed here, are put together below:
<br>
<br>
<ul>
<li><a href="">XAIPipe</a> (formerly <a href ="">XAISuite</a>)</li>
<li><a href="">CandyLLM</a></li>
<li><a href="">Hallucina</a></li>
</ul>
</details>
</div>
