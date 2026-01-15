---
layout: page

permalink: /posts/

# jekyll-seo-tag
# see https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/advanced-usage.md
canonical_url: https://lilyroger.com/posts/

# article:date_modified
# see _includes/head.html
date_modified: 2026-01-15 08:00:00 +0800

title: 文章
tagline: "行程，游记，攻略和指南"
image_base: posts/water-mirror-bordeaux
image_alt: "在法国波尔多的水镜广场 (Miroir d'eau) 是全球最大的反射水池，通过地面石板上覆盖的薄薄水层，将 18 世纪的古典建筑群与现代城市景观完美倒映在波光粼粼的镜面之中。"

---

<section class="container d-flex align-items-center justify-content-center mt-5 p-5">
    <p>
        这里是我们所有的博客文章。有关于行程，城市，机场，交通，徒步，马拉松，和更多趣事的游记，指南和攻略。 
    </p>
</section>

<section class="container collection">

    <h2 class="text-center my-5">所有文章</h2>

    {%- if site.posts.size > 0 -%}
    <ul class="list-unstyled row row-cols-1 row-cols-md-2 row-cols-lg-4 g-3">
        {%- for post in site.posts -%}
        <li class="col">
            {% include post-card.html post = post %}
        </li>
        {%- endfor -%}
    </ul>
    {%- endif -%}

</section>