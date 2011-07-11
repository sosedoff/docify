require 'rdoc/rdoc'
require 'RedCloth'
require 'rdiscount'

module Docify
  module Markup
    extend self
  
    # Auto-detect format from filename and render content
    def render(filename, content)
      name = File.basename(filename.to_s.strip)
      raise ArgumentError, 'Filename required!' if name.empty?
      format = detect_format(name)
      format == :text ? content : self.send(format, content)
    end
    
    if RUBY_VERSION >= '1.9'
      # Render content for RDoc on Ruby 1.9
      def rdoc(content)
        markup = RDoc::Markup::ToHtml.new
        markup.convert(content)
      end
    else
      # Render content for RDoc
      def rdoc(content)
        simple_markup = SM::SimpleMarkup.new
        generator = Generators::HyperlinkHtml.new('', OpenStruct.new)
        simple_markup.add_special(/((link:|https?:|mailto:|ftp:|www\.)\S+\w)/, :HYPERLINK)
        simple_markup.add_special(/(((\{.*?\})|\b\S+?)\[\S+?\.\S+?\])/, :TIDYLINK)
        simple_markup.convert(content, generator)     
      end
    end
    
    # Render content for Markdown
    def markdown(content)
      Markdown.new(content).to_html
    end
    
    # Render content for Textile
    def textile(content)
      RedCloth.new(content).to_html
    end
  
    protected
    
    # Detect markup format from filename
    def detect_format(filename)
      case(filename)
        when /\.rdoc/i
          :rdoc
        when /\.(md|mkdn?|mdown|markdown)/i
          :markdown
        when /\.textile/i
          :textile
        else
          :text
      end
    end
  end
end