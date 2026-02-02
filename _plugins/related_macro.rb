require 'asciidoctor/extensions'

Asciidoctor::Extensions.register do
  block_macro :related do
    process do |parent, target, attrs|
      site = Jekyll.sites.first
      next unless site

      # Parse Slugs
      slugs = target.split(',').map(&:strip)
      posts = slugs.map do |slug|
        site.posts.docs.find { |p| p.data['slug'] == slug || p.url.include?(slug) }
      end.compact

      next if posts.empty?

      # Extract Roles
      # Asciidoctor maps the first positional attribute or 'role' key to roles
      custom_roles = attrs['role'] || attrs[1]
      role_class = ["relatedblock", custom_roles].compact.join(' ')

      # Content Helper
      get_summary = lambda do |post|
        summary = post.data['tagline'] || post.data['description']
        if summary.nil? || summary.empty?
          summary = post.data['excerpt'].to_s.gsub(/<[^>]*>/, '').strip
          summary = summary[0..100] + "..." if summary.length > 100
        end
        summary
      end

      # Generate Cards HTML
      inner_html = if posts.size == 1
        p = posts.first
        img = p.data['image'] || {}
        <<~HTML
          <div class="card mb-0 border-0 shadow-sm overflow-hidden" style="background: #f8f9fa;">
            <div class="row g-0 align-items-center">
              <div class="col-4 col-md-3">
                <img src="#{img['path']}" srcset="#{img['srcset']}" sizes="#{img['sizes'] || '30vw'}" 
                     alt="#{img['alt']}" class="img-fluid" style="height:160px; width:100%; object-fit:cover;">
              </div>
              <div class="col-8 col-md-9">
                <div class="card-body">
                  <h5 class="card-title mb-1">
                    <a href="#{p.url}" class="stretched-link text-decoration-none text-dark fw-bold">#{p.data['title']}</a>
                  </h5>
                  <p class="card-text text-muted small mb-0">#{get_summary.call(p)}</p>
                </div>
              </div>
            </div>
          </div>
        HTML
      else
        cards = posts.take(2).map do |p|
          img = p.data['image'] || {}
          <<~HTML
            <article class="col-6">
              <div class="card h-100 border-0">
                <img src="#{img['path']}" srcset="#{img['srcset']}" alt="#{img['alt']}" 
                     class="card-img-top">
                <div class="card-body p-3">
                  <h3 class="card-title h6 my-1">
                    <a href="#{p.url}" class="stretched-link text-decoration-none text-body">#{p.data['title']}</a>
                  </h3>
                  <p class="card-text small text-body-secondary my-1">#{get_summary.call(p)}</p>
                </div>
              </div>
            </article>
          HTML
        end.join
        %(<div class="row g-3">#{cards}</div>)
      end

      # 5. Semantic Wrapper with Dynamic Roles
      wrapper_html = <<~HTML
        <aside class="p-4 mb-4 bg-body-secondary relatedblock #{role_class}" aria-label="相关文章">
          #{inner_html}
        </aside>
      HTML

      create_pass_block parent, wrapper_html, attrs, content_model: :raw
    end
  end
end
