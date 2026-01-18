---
layout: default

# jekyll-seo-tag
# see https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/advanced-usage.md
canonical_url: https://lilyroger.com
---
<!-- the front cover fills the entire initial viewable area -->
<div id="front-cover" class="position-relative vh-100 overflow-hidden">

  <header class="position-absolute top-0 start-0 w-100 z-3 bg-dark bg-opacity-50" role="banner" data-bs-theme="dark">
    {%- include navbar.html -%}
  </header>

  {% comment %}
  Fetch the trip marked as 'featured' from the Trips collection.
  If multiple are marked, '| first' picks the first one found.
  If no one is marked, fall back to the lastest one.
  {% endcomment %}

  {% assign trip = site.trips | where: "featured", true | first %}
  {% unless trip %}
  {% assign trip = site.trips | reverse | first %}
  {% endunless %}

  <!-- art direction of the hero image that fills the entire parent container -->
  {% capture image_url_base %}{{ site.image_path }}{{ trip.image_base }}{%
  endcapture %}
  <picture>
    <!--art direction / mobile / landscape -->
    <source media="(min-width: 768px)" srcset="
              {{ image_url_base }}-4x3-1200.avif 1200w, 
              {{ image_url_base }}-4x3-2400.avif 2400w, 
              " sizes="100vw"> <!-- always 100% of the view width -->
    <source srcset="
              {{ image_url_base }}-3x4-900.avif 900w,
              {{ image_url_base }}-3x4-1800.avif 1800w,
              " sizes="100vw">
    <img src="{{ image_url_base }}-4x3-1200.avif" class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover z-n1"
      alt="{{ trip.image_alt }}">
  </picture>

  <!-- the overlay of the hero text -->
  <div class="position-absolute bottom-0 start-0 w-100 h-100 z-1"
    style="background: linear-gradient(to top, rgba(0,0,0,0) 30%, rgba(0,0,0,0.5) 50%, rgba(0,0,0,0) 70%);">
  </div>

  <!-- hero text centered horizontally and vertically -->
  <div class="container h-100 d-flex align-items-center justify-content-center text-center position-relative z-2">
    <div class="hero-wrapper">

      <hgroup class="text-white hero-text">
        <p class="small kicker">最新的旅行故事</p>
        <h2 class="mt-0 mb-3">{{ trip.title }}</h2>
        <p class="dek">{{ trip.tagline }}</p>
      </hgroup>

      <div>
        <a href="{% link {{ trip.path }} %}" class="btn btn-outline-light rounded-pill px-3" role="button">
          去看看
        </a>
      </div>
    </div>
  </div>

  <!-- floating arrow indicator using the Bootstrap icon positioned absolutely at bottom center -->
  <a href="#content" class="position-absolute bottom-0 start-50 translate-middle-x pb-5 z-2" aria-label="滚动条向下滚动">
    <div class="animate-float">
      <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-arrow-down-circle"
        viewBox="0 0 16 16">
        <path fill-rule="evenodd"
          d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293z" />
      </svg>
    </div>
  </a>

</div>

<!-- main content -->
<main id="content" class="container-fluid">

  <!-- welcome main content header-->
  <header class="container py-5">
    <hgroup class="text-center">
      <p class="text-body-secondary kicker">{{ site.tagline }}</p>
      <h1>欢迎来到我们的网站</h1>
      <p>{{ site.description }}</p>
    </hgroup>
  </header>

  {%- if site.posts -%}
  <div class="container-fluid bg-body-tertiary py-5 mt-1">
    <!-- latest posts  -->
    <section id="latest-posts" class="container">
      <hgroup class="text-center">
        <h2>最新旅行故事</h2>
      </hgroup>
      <ul class="list-unstyled row row-cols-1 row-cols-sm-2 row-cols-xl-4 g-4">
        {%- for post in site.posts limit:4 -%}
        <li class="col">
          {% include card-post.html post = post %}
        </li>
        {%- endfor -%}
      </ul>
      <div class="d-flex align-items-center justify-content-center mt-5">
        <a class="btn btn-outline-secondary rounded-pill px-3" role="button"
          href="{% link _pages/posts.md %}">
          更多旅行故事
        </a>
      </div>
    </section>
  </div>
  {%- endif -%}

  {%- assign posts = site.tags["精选"] -%}
  {%- if posts -%}
  <div class="container-fluid bg-body-tertiary py-5">
    <section id="featured-posts" class="container">
      <hgroup class="text-center">
        <h2>精选旅行故事</h2>
      </hgroup>
      <ul class="list-unstyled row row-cols-1 row-cols-sm-2 row-cols-xl-4 g-4">
        {%- for post in posts -%}
        <li class="col">
          {% include card-post.html post = post %}
        </li>
        {%- endfor -%}
      </ul>
      <div class="d-flex align-items-center justify-content-center mt-5">
        <a class="btn btn-outline-secondary rounded-pill px-3" role="button"
          href="{% link _pages/posts.md %}">
          更多旅行故事
        </a>
      </div>
    </section>
  </div>
  {% endif %}

</main>

{%- include footer.html -%}