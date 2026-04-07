module Jekyll
  # Custom Liquid Tag: {% related slugs="slug-a, slug-b" %}
  # Provides a responsive Bootstrap card layout for cross-referencing blog content.
  class RelatedTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @params = {}
      # Regex to parse key="value" style parameters from the tag call
      markup.scan(/(\w+)\s*=\s*["']?([^"'\s]+)["']?/) do |key, value|
        @params[key] = value
      end
    end

    def render(context)
      site = context.registers[:site]
      return "" unless @params['slugs']
      
      # Split input slugs into an array
      slug_list = @params['slugs'].split(/[\s,]+/).map(&:strip)
      
      # Search through both posts and pages
      all_docs = site.posts.docs + site.pages
      targets = slug_list.map do |slug|
        found = all_docs.find { |p| p.data['slug'] == slug }
        
        # Build-time terminal logging for broken links (No browser output)
        if found.nil?
          Jekyll.logger.error "Related Tag Error:", "Slug '#{slug}' not found! Error in file: #{context['page']['path']}"
        end
        found
      end.compact

      return "" if targets.empty?

      # Push variables into the Liquid context and render the include
      context.stack do
        context['related_items'] = targets
        # Expose all other parameters (like 'title') to the include file
        @params.each { |k, v| context[k] = v }
        
        Liquid::Template.parse("{% include _related.html %}").render(context)
      end
    end
  end
end

Liquid::Template.register_tag('related', Jekyll::RelatedTag)
