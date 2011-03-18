require 'lib/docify/version'

Gem::Specification.new do |gem|
  gem.name    = 'docify'
  gem.version = Docify::VERSION
  gem.date    = Time.now.strftime('%Y-%m-%d')

  gem.add_dependency 'github-markup', '>= 0.5.3'
  gem.add_dependency 'rdiscount',     '>= 1.6.8'
  gem.add_dependency 'RedCloth',      '>= 4.2.3'

  gem.summary = "Docify - Render documentation with favorite markup into html."
  gem.description = "Docify provides a command line tool to render documentation files (RDoc, Markdown, Textile) into nice-looking html."

  gem.authors  = ['Dan Sosedoff']
  gem.email    = 'dan.sosedoff@gmail.com'
  gem.homepage = 'http://github.com/sosedoff/docify'

  gem.rubyforge_project = nil
  gem.has_rdoc = false
  
  gem.executables = ['docify']
  gem.default_executable = 'docify'
  gem.files = Dir['Rakefile', '{bin,lib}/**/*', 'README*']
end