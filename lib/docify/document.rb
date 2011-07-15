module Docify
  class Document
    include Docify::Format
    include Docify::Markup
    
    attr_reader :path
    attr_reader :content
    attr_reader :format
    
    # Initialize a new Document object with file path
    #   @path   => Input file path
    #   @format => Markup (default: markdown) 
    def initialize(path, format=:markdown)
      raise ArgumentError, "File [#{path}] does not exist!" unless File.exists?(path)
      raise ArgumentError, "File required!" unless File.file?(path)
      @path = path
      @format = detect_format(path)
      @content = ""
    end
    
    # Render document content
    #   :format => Set render format (auto-detection)
    #   :html => Render into html (default: true)
    #   :css => Include CSS styles (default: true)
    def render(options={})
      format = (options[:format] || detect_format(@path)).to_sym
      use_html = options.key?(:html) ? options[:html] == true : true
      use_css = options.key?(:css) ? options[:css] == true : true
      
      unless valid_format?(format)
        raise ArgumentError, "Invalid format: #{format}"
      end
      
      @content = Docify::Markup.send(format, File.read(@path))
      if use_html == true
        params = {
          :title   => File.basename(@path),
          :content => @content,
        }
        params[:css] = Docify::CSS if use_css == true
        @content = Docify::Template.new(Docify::TEMPLATE).render(params)
      end
      @content
    end
    
    # Save rendered content into the file
    #   @path => Output file path
    def save_to(path)
      unless File.exists?(File.dirname(path))
        raise ArgumentError, "Output path does not exist!"
      end
      if File.directory?(path)
        raise ArgumentError, "Output path should be a file!"
      end
      File.open(path, 'w') { |f| f.write(@content) }
    end
  end
end