Gem::Specification.new do |s|
  s.platform      = Gem::Platform::RUBY
  s.name          = 'dbpedia'
  s.version       = '0.0.2'
  s.summary       = 'DBpedia Client for Ruby'
  s.description   = 'Simple search for DBpedia resources. Optional support for sparql.'

  s.author        = 'Roman Ernst'
  s.email         = 'rernst@farbenmeer.bet'
  s.license       = 'CC BY-SA 3.0'
  s.homepage      = 'https://github.com/farbenmeer/dbpedia'
  s.files         = Dir['README.md', 'lib/**/*', 'config/dbpedia.yml']
  s.require_path  = 'lib'

  s.required_ruby_version = '>= 1.9.2'

  s.add_dependency 'nokogiri', '>= 1.5.5'
end