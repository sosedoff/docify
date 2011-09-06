module Docify
  FORMATS = [:markdown, :textile, :rdoc]
  
  module Format
    # Detects if specified format is supported
    def valid_format?(f)
      FORMATS.include?(f.to_sym)
    end
    
    # Detects markup format from filename
    def detect_format(filename)
      case(filename)
        when /\.rdoc/i
          :rdoc
        when /\.(md|mkdn?|mdown|markdown)/i
          :markdown
        when /\.textile/i
          :textile
      end
    end
  end

  # Returns true if given format is supported
  #
  def self.valid_format?(f)
    f.nil? ? false : FORMATS.include?(f.to_sym)
  end
end