module Docify
  # All supported formats
  FORMATS = ['rdoc', 'markdown', 'textile']
  
  # Aliases for file extensions
  ALIASES = {
    '.rdoc'     => 'rdoc',
    '.textile'  => 'textile',
    '.markdown' => 'markdown',
    '.md'       => 'markdown'
  }
  
  # Returns true if provided format is supported
  def self.valid_format?(f)
    FORMATS.include?(f)
  end
  
  # Automatically detect format from extension
  def self.detect_format(file)
    ext = File.extname(file).downcase
    ALIASES.key?(ext) ? ALIASES[ext] : FORMATS.first
  end
end