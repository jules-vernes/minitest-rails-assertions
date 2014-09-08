# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'minitest/rails/assertions/version'

Gem::Specification.new do |gem|
  gem.name          = 'minitest-rails-assertions'
  gem.version       = Minitest::Rails::Assertions::VERSION
  gem.authors       = ['Geoffrey Roguelon', 'Loïc Sence']
  gem.email         = ['geoffrey.roguelon@gmail.com', 'senceloic@gmail.com']
  gem.summary       = %q{The gem minitest-rails-assertions extends MiniTest to add some assertions to Rails tests.}
  gem.description   = %q{The gem minitest-rails-assertions extends MiniTest to add some assertions to Rails tests.}
  gem.homepage      = 'https://github.com/jules-vernes/minitest-rails-assertions'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.7'
  gem.add_development_dependency 'rake', '~> 10.0'
end
