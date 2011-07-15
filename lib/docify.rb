require 'docify/utils'
require 'docify/format'
require 'docify/template'
require 'docify/style'
require 'docify/markup'
require 'docify/document'

module Docify
  extend Docify::Markup
  
  class << self
    # Alias for Docify::Document.new
    #
    # @return Docify::Document
    def new(path, format=:markdown)
      Docify::Document.new(path, format)
    end
    
    # Simply renders content for the markup
    def render(text, format=:markdown)
      if Docify::FORMATS.include?(format.to_sym)
        Docify::Markup.send(format.to_sym, text)
      else
        raise ArgumentError, "Invalid markup: #{format}."
      end
    end
  end
end
