$:.unshift File.expand_path("../..", __FILE__)

require 'docify'

README_FILES  = {
  'README' => 'rdoc',
  'README.rdoc' => 'rdoc',
  'README.md' => 'markdown',
  'README.markdown' => 'markdown',
  'README.textile' => 'textile',
  'README.txt' => 'rdoc',
  'README.foo' => 'rdoc'
}