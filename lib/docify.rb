require 'docify/utils'
require 'docify/format'
require 'docify/template'
require 'docify/style'
require 'docify/markup'
require 'docify/document'

module Docify
  # Simply renders content for the markup
  def self.render(text, format='markdown')
    if Docify::FORMATS.include?(format.to_s)
      Docify::Markup.send(format.to_sym, text)
    else
      raise ArgumentError, "Invalid markup: #{format}."
    end
  end
end
