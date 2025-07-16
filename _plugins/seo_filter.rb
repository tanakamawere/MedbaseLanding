module Jekyll
  module SEOFilter
    # Generate meta description from content if not provided
    def seo_description(input)
      if input.nil? || input.empty?
        return site.config['description']
      end
      
      # Strip HTML and truncate
      stripped = input.gsub(/<[^>]*>/, '').strip
      truncated = stripped.length > 160 ? stripped[0..156] + '...' : stripped
      truncated
    end
    
    # Generate keywords from categories and tags
    def seo_keywords(categories, tags, fallback = '')
      keywords = []
      
      if categories && categories.any?
        keywords.concat(categories)
      end
      
      if tags && tags.any?
        keywords.concat(tags)
      end
      
      # Add default keywords if none provided
      if keywords.empty? && !fallback.empty?
        return fallback
      end
      
      # Remove duplicates and join
      keywords.uniq.join(', ')
    end
    
    # Generate reading time estimate
    def reading_time(input)
      words = input.split.length
      minutes = (words / 200.0).ceil
      minutes < 1 ? 1 : minutes
    end
    
    # Generate excerpt for SEO
    def seo_excerpt(input, length = 160)
      if input.nil? || input.empty?
        return ''
      end
      
      # Strip HTML and markdown
      stripped = input.gsub(/<[^>]*>/, '').gsub(/\*\*(.*?)\*\*/, '\1').gsub(/\*(.*?)\*/, '\1')
      
      # Truncate to specified length
      if stripped.length > length
        stripped[0..length-4] + '...'
      else
        stripped
      end
    end
    
    # Generate structured data for articles
    def article_schema(page, site)
      schema = {
        '@context' => 'https://schema.org',
        '@type' => 'Article',
        'headline' => page['title'],
        'description' => seo_description(page['description']),
        'author' => {
          '@type' => 'Person',
          'name' => page['author'] || site.config['author']['name']
        },
        'publisher' => {
          '@type' => 'Organization',
          'name' => site.config['title'],
          'logo' => {
            '@type' => 'ImageObject',
            'url' => "#{site.config['url']}/assets/img/medbase_transparent.png"
          }
        },
        'datePublished' => page['date'],
        'mainEntityOfPage' => {
          '@type' => 'WebPage',
          '@id' => "#{site.config['url']}#{page['url']}"
        }
      }
      
      if page['thumbnail']
        schema['image'] = "#{site.config['url']}#{page['thumbnail']}"
      end
      
      if page['categories'] && page['categories'].any?
        schema['articleSection'] = page['categories'].first
      end
      
      if page['tags'] && page['tags'].any?
        schema['keywords'] = page['tags'].join(', ')
      end
      
      schema.to_json
    end
  end
end

Liquid::Template.register_filter(Jekyll::SEOFilter)
