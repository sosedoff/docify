$:.unshift File.expand_path("../..", __FILE__)

require 'simplecov'
SimpleCov.start do
  add_group 'Docify', 'lib/docify'
end

require 'docify'

README_FILES  = {
  'README'          => 'rdoc',
  'README.rdoc'     => 'rdoc',
  'README.md'       => 'markdown',
  'README.markdown' => 'markdown',
  'README.textile'  => 'textile',
  'README.txt'      => 'rdoc',
  'README.foo'      => 'rdoc'
}

def fixture_path(file=nil)
  path = File.expand_path("../fixtures", __FILE__)
  path = File.join(path, file) unless file.nil?
  path
end

def fixture(file)
  File.read(File.join(fixture_path, file))
end
