---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

{% if site.author.googlescholar %}
  <div class="wordwrap">You can also find my articles on <a href="{{site.author.googlescholar}}">my Google Scholar profile</a>.</div>
{% endif %}
<br>
<div style="background-color: white; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 20px; padding-top: 8px; border-radius: 8px; min-width:600px;margin-bottom: 25px">
<details>
<summary><b>Which publications were chosen?</b></summary>

Note that these are only my <i>academic</i> publications. For my sporadically maintained blog on everything computer science and environmental conservation related, please visit <a href="shreyanmmitra.substack.com">this site</a>. For my book list and book reviews, visit <a href="shreyanreviews.wordpress.com">this site</a>. And for my art, visit <a href="https://shreyansart.wordpress.com">this site</a>.

I also edited and co-wrote a book using my experience as a geography bee and olympiad champion at the national level to help the next generation of contestants to succeed. <a href="https://www.amazon.com/Geography-Bee-Simplified-Preparation-Competitions/dp/B096YX7D5X">Buy it</a> from Amazon.
</details>
</div>

<div style="background-color: white; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 20px; padding-top: 8px; border-radius: 8px; min-width:600px;margin-bottom: 25px">
<details>
<summary> <b> How are these organized? </b> </summary>
Sometimes, I have grouped multiple published papers into one listing. This can happen for multiple reasons, such as some papers being intermediate versions of another paper, or papers being associated with the code or dataset used by another paper.

Wherever a listing has more than one published paper associated with it, I have specified how many published papers are represented by that listing.

Click the link of each entry to see a longer description, along with links to download all the papers and code associated with each listing. For your convenience, links for the latest/most representative version of the listing are included in the short description itself.
</details>
</div>


{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}

<div style="background-color: white; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 20px; padding-top: 8px; border-radius: 8px; min-width:600px;margin-bottom: 25px">
<b>Research Affiliations</b>
<br>
<br>
<button onclick="location.href='http://aiea-lab.github.io'" style='border-radius:12px;background-color:rgb(203, 195, 227);border:none'> <img src='../files/AIEALogo.png' style='height:20px;'/>  AIEA Lab @UCSC</button> <button style='border-radius:12px;background-color:rgb(203, 195, 227);border:none'> SocialRL Lab @UWSeattle</button>
</div>
