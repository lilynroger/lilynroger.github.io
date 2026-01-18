---
layout: page

permalink: /destinations/

# jekyll-seo-tag
# see https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/advanced-usage.md
canonical_url: https://lilyroger.com/destinations/

# article:date_modified
# see _includes/head.html
date_modified: 2026-01-14 20:00:00 +0800

title: 目的地
tagline: 下一次旅行，你想去哪里？
description: 这里是我们曾经访问过的旅行目的地国家。从这里出发，可以找到所有我们按照国家整理的旅行指南和攻略。尽管有些过去久远的旅行，我们可能没有精力整理出来了，可还是会在这里保留一席之地。
image_base: destinations/chapel-madonna-vitaleta-val-dorcia
image_alt: 这座被誉为托斯卡纳地标的 Madonna di Vitaleta Chapel（小耳朵教堂），位于意大利锡耶纳省的 San Quirico d'Orcia（圣奎里科-多尔恰）和 Pienza（皮恩扎）之间，坐落于 Val d'Orcia（奥尔恰谷）的起伏丘陵间，是 UNESCO 世界文化遗产区域内最著名的摄影景点和旅游地标之一。
---

<div class="container-fluid py-5" aria-label="Content">  

  <section class="container">
    <p>{{ page.description | escape }}</p>
  </section>

</div>
  
<div class="container-fluid bg-body-tertiary py-5" aria-label="Content">  
  <section class="container">
  
    <hgroup class="text-center my-5">
      <h2 class="mb-3">所有访问过的国家</h2>
      <p class="small text-body-secondary">已经有 <span class="fw-medium">{{site.destinations.size}}</span> 个国家，按照国家名称的拼音排序。</p>
    </hgroup>
  
    <ul class="list-unstyled row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
      {% assign items = site.destinations %}
      {%- for item in items -%}
      <li class="col">
        {% include card-destination.html item = item %}
      </li>
      {%- endfor -%}
    </ul>

  </section>
</div>

