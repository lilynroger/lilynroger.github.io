---
layout: collection
permalink: /trips/

# jekyll-seo-tag
# see https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/advanced-usage.md
canonical_url: https://lilyroger.com/trips/

title: 旅行
tagline: 激发旅行灵感
description: 这里是我们旅行的时间线。从这里出发，可以找到属于每一次独特旅行的游记，行程，指南和攻略。
picture:
  slug: funningur-the-faroe-islands
  alt: 在丹麦的法罗群岛 (The Faroe Islands)，被深邃峡湾环抱的古老村庄 Funningur 相传是维京人最早的落脚地。它的名字意为“发现”.
---

<section class="d-flex align-items-center justify-content-center my-5 p-5">
  <p class="lead text-center" style="max-width: 400px; width: 100%">{{ page.description | escape }}</p>
</section>

<section class="container collection">
  <h2 class="text-center my-5">所有旅行</h2>
  <ul class="list-unstyled row row-cols-1 row-cols-lg-2 g-4">
    {% assign items = site.trips | reverse %}
    {%- for item in items -%}
    <li class="col">
      {% include collection-item-card.html item = item %}
    </li>
    {%- endfor -%}
  </ul>
</section>
