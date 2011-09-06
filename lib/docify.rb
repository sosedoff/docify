require 'docify/utils'
require 'docify/format'
require 'docify/template'
require 'docify/style'
require 'docify/markup'
require 'docify/document'

module Docify
  extend Docify::Markup
  extend Docify::Format
  
  class << self
    # Alias for Docify::Document.new
    #
    # @return [Docify::Document]
    #
    def new(path, format=:markdown)
      Docify::Document.new(path, format)
    end
    
    # Simply renders content for the markup
    #
    def render(text, format=:markdown)
      if Docify::FORMATS.include?(format.to_sym)
        Docify::Markup.send(format.to_sym, text)
      else
        raise ArgumentError, "Invalid markup: #{format}."
      end
    end
    
    # Simple render content with auto-detection from filename
    # It returns the original text if markup language was not detected
    # or not supported
    #
    def render_auto(text, filename)
      format = detect_format(filename)
      
      if Docify.valid_format?(format)
        Docify::Markup.send(format, text)
      else
        text
      end
    end
  end
end
