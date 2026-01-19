---
layout: page

permalink: /trips/

# jekyll-seo-tag
# see https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/advanced-usage.md
canonical_url: https://lilyroger.com/trips/

# article:date_modified
# see _includes/head.html
date_modified: 2026-01-18 20:00:00 +0800

title: 旅行
tagline: 需要旅行的灵感？
image_base: trips/funningur-the-faroe-islands
image_alt: 在丹麦的法罗群岛 (The Faroe Islands)，被深邃峡湾环抱的古老村庄 Funningur 相传是维京人最早的落脚地。它的名字意为“发现”。
---

<div class="py-5" aria-label="Content">

<section class="container">
  <p>
  这里是我们旅行的时间线。从这里出发，可以找到属于每一次旅行的行程，游记，指南和攻略。我们喜欢别出心裁。每一次旅行最好都有特殊的主题和意义。比如峡湾徒步之旅，马拉松之旅，红酒和香槟之旅，米其林之旅，还有北大西洋双群岛之旅。希望这些可以激发你的旅行灵感，并帮助你计划下一次属于你的独特旅行。
  </p>
</section>

</div>

<div class="bg-body-tertiary py-5" aria-label="Content">

<section class="container">

  {% assign items = site.trips | reverse %}
  <hgroup class="text-center my-5">
    <h2 class="mb-3">所有旅行</h2>
    <p class="small text-body-secondary">共有 <span class="fw-medium">{{items.size}}</span> 次旅行</p>
  </hgroup>

  <ul class="list-unstyled row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
    {%- for item in items -%}
    <li class="col">
      {% include card-trip.html item = item %}
    </li>
    {%- endfor -%}
  </ul>
</section>

</div>