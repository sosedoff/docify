require File.expand_path('../lib/docify/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "docify"
  s.version     = Docify::VERSION.dup
  s.summary     = "Terminal tool to render markups into html"
  s.description = "Docify provides a command line tool to render documentation files (RDoc, Markdown, Textile) into nice-looking html."
  s.homepage    = "http://github.com/sosedoff/docify"
  s.authors     = ["Dan Sosedoff"]
  s.email       = ["dan.sosedoff@gmail.com"]
  
  s.add_development_dependency 'rake', '~> 0.8'
  s.add_development_dependency 'rspec', '~> 2.5'
  s.add_development_dependency 'ZenTest', '~> 4.5'
  s.add_development_dependency 'simplecov', '~> 0.4'
  s.add_development_dependency 'yard', '~> 0.6'
  
  s.add_runtime_dependency 'rdiscount', '~> 1.6.8'
  s.add_runtime_dependency 'RedCloth', '~> 4.2.3'
  s.add_runtime_dependency 'rdoc', '~> 3.7'
  
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  s.require_paths = ["lib"]
  s.default_executable = 'docify'
end