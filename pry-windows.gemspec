Gem::Specification.new do |gem|
  gem.name = 'pry-windows'
  gem.version = '0.1'

  gem.summary = 'Hacks to make pry work better under windows'
  gem.description = "Makes it easier to get utf-8 support for pry in windows"

  gem.authors = ['Conrad Irwin']
  gem.email = %w(conrad.irwin@gmail.com)
  gem.homepage = 'http://github.com/ConradIrwin/pry-windows'

  gem.license = 'MIT'

  gem.required_ruby_version = '>= 1.8.7'

  gem.add_dependency 'pry', '>= 0.9.12'

  gem.files = `git ls-files`.split("\n")
end
