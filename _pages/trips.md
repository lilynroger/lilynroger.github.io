---
layout: collection

permalink: /trips/

# jekyll-seo-tag
# see https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/advanced-usage.md
canonical_url: https://lilyroger.com/trips/

# article:date_modified
# see _includes/head.html
date_modified: 2026-01-14 20:00:00 +0800

title: 旅行
tagline: 激发旅行灵感
image_base: trips/funningur-the-faroe-islands
image_alt: 在丹麦的法罗群岛 (The Faroe Islands)，被深邃峡湾环抱的古老村庄 Funningur 相传是维京人最早的落脚地。它的名字意为“发现”。
---

<section class="container d-flex align-items-center justify-content-center mt-5 p-5">
  <p>
  这里是我们旅行的时间线。从这里出发，可以找到属于每一次旅行的行程，游记，指南和攻略。我们喜欢别出心裁。每一次旅行最好都有特殊的主题和意义。比如峡湾徒步之旅，马拉松之旅，红酒和香槟之旅，米其林之旅，还有北大西洋双群岛之旅。希望这些可以激发你的旅行灵感，并帮助你计划下一次属于你的独特旅行。
  </p>
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
