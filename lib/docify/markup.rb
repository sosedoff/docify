require 'rdoc'
require 'RedCloth'
require 'rdiscount'

module Docify
  module Markup
    extend self
    
    # Render content for RDoc
    def rdoc(content)
      markup = RDoc::Markup::ToHtml.new
      markup.convert(process_content(content))
    end
    
    # Render content for Markdown
    def markdown(content)
      Markdown.new(process_content(content)).to_html
    end
    
    # Render content for Textile
    def textile(content)
      RedCloth.new(process_content(content)).to_html
    end

    def process_content(content)
      data = content.gsub(/^``` ?([^\r\n]+)?\r?\n(.+?)\r?\n```\r?$/m) do
        if !$1.to_s.empty?
          "<pre class=\"code-#{$1.strip}\">#{$2}</pre>"
        else
          "<pre>#{$2}</pre>"
        end
      end
      data
    end
  end
end