module Docify
  class Template
    REGEX = /(\{\{([a-z\-\_]{1,})\}\})/i
    
    # Initialize Template object with a string template
    def initialize(content)
      @template = content.strip.to_s
      raise ArgumentError, "Template content required!" if @template.empty?
    end
    
    # Render template
    #   params - Hash of parameters.
    #            Each params in template should be wrapped with {{var}}. 
    def render(params={})
      params.stringify_keys!
      @template.gsub(REGEX) do |m|
        key = m.scan(REGEX).flatten.last.to_s
        m = params[key]
      end
    end
  end
end
