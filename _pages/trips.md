---
layout: default
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
<!--
  Use absolute positioning for the header to pull it out of the normal document flow,
  so we can put page-specific hero, including the image and title in the <main> element
  to maintain clear SEO and accessibility hierarchy.
 -->
<header id="site-header" class="position-absolute top-0 start-0 w-100 z-3 bg-dark bg-opacity-50" role="banner"
  data-bs-theme="dark">
  {%- include navbar.html -%}
</header>

<!-- the page-specific content -->
<main class="mb-5">
  <!-- the front cover fills the entire initial viewable area -->
  <header id="hero" class="position-relative overflow-hidden" style="height: 500px">

    <!-- art direction of the hero image that fills the entire parent container -->
    {% capture image_url_base %}{{ site.image_path }}trips/{{ page.picture.slug }}{%
    endcapture %}
    <picture>
      <!--art direction / mobile / landscape -->
      <source media="(min-width: 768px)" srcset="
              {{ image_url_base }}-1200.webp 1200w,
              {{ image_url_base }}-2400.webp 2400w,
              " sizes="100vw"> <!-- always 100% of the view width -->
      <!-- <source srcset="
              {{ image_url_base }}-portrait-1200.webp 1200w,
              {{ image_url_base }}-portrait-2400.webp 2400w,
              " sizes="100vw"> -->
      <img src="{{ image_url_base }}-1200.webp"
        class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover z-n1" alt="{{ trip.picture.alt }}">
    </picture>

    <!-- hero text centered horizontally and vertically -->
    <div class="container h-100 d-flex align-items-center justify-content-center text-center position-relative z-2">
      <div class="hero-wrapper">

        <hgroup class="text-white hero-text">
          <h1 class="display-2">{{ page.title | escape }}</h1>
          <p class="lead dek">{{ page.tagline }}</p>
        </hgroup>

      </div>
    </div>

  </header>

  <section class="d-flex align-items-center justify-content-center my-5 p-5">
    <p class="lead text-center" style="max-width: 400px; width: 100%">{{ page.description | escape }}</p>
  </section>

  <div class="collection">
    <div class="container collection-items">

      <div class="row row-cols-1 row-cols-lg-2 g-4">
        {% assign items = site.trips | reverse %}
        {%- for item in items -%}
        <div class="col">
          {% include collection-item-card.html item = item %}
        </div>
        {%- endfor -%}
      </div>

    </div>
  </div>
</main>

{%- include footer.html -%}