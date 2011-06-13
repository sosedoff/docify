if RUBY_VERSION.include?('1.9')
  require 'rdoc/markup/to_html'
else
  require 'rdoc/generators/html_generator'
  require 'ostruct'
end

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
    
    # Render content for Markdown
    def markdown(content)
      Markdown.new(content).to_html
    end
    
    if RUBY_VERSION.include?('1.9')
      # Render content for RDoc
      def rdoc(content)
        RDoc::Markup::ToHtml.new.convert(content)
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