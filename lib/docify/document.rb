module Docify 
  class Document
    attr_reader :path
    attr_reader :content
    
    # Initialize a new Document object with file path
    def initialize(path)
      raise ArgumentError, "File [#{path}] does not exist!" unless File.exists?(path)
      raise ArgumentError, "File required!" unless File.file?(path)
      @path = path
      @content = ""
    end
    
    # Render document by specified format
    def render(format, embed_css=true)
      raise ArgumentError, 'Invalid format!' unless FORMATS.include?(format)
      result = Docify::Markup.render("doc.#{format}", File.read(@path))
      if embed_css
        params = {:title => File.basename(@path), :content => result}
        params[:css] = Docify::CSS if embed_css
        @content = template(params)
      else
        @content = result
      end
      @content
    end
    
    # Save rendered content into file
    def save_to(path)
      unless File.exists?(File.dirname(path))
        raise ArgumentError, "Output path does not exist!"
      end
      if File.directory?(path)
        raise ArgumentError, "Output path should be a file!"
      end
      File.open(path, 'w') { |f| f.write(@content) }
    end
    
    private
    
    # Render template with provided data
    def template(params={})
      TEMPLATE.gsub(REGEX) do |m|
        m = params[m.scan(REGEX).flatten.last.to_sym]
      end
    end
  end
end