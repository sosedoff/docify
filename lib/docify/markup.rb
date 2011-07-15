require 'rdoc/markup/to_html'
require 'RedCloth'
require 'rdiscount'

module Docify
  module Markup
    extend self
    
    # Render content for RDoc
    def rdoc(content)
      markup = RDoc::Markup::ToHtml.new
      markup.convert(content)
    end
    
    # Render content for Markdown
    def markdown(content)
      Markdown.new(content).to_html
    end
    
    # Render content for Textile
    def textile(content)
      RedCloth.new(content).to_html
    end
  end
end