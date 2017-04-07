# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shipstation/version"

Gem::Specification.new do |gem|
  gem.name          = "shipstation-rb"
  gem.version       = ShipStation::VERSION
  gem.licenses      = 'MIT'
  gem.authors       = ["Rique Li"]
  gem.email         = ["hi@liwei.me"]
  gem.description   = 'An API wrapper for the ShipStation API.base on Cody Duval\'s 0.0.1'
  gem.summary       = 'Ruby wrapper ShipStation API'
  gem.homepage      = 'https://github.com/liwei78/shipstation-ruby'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rash'
  gem.add_dependency 'ruby_odata'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'turn'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'bundler'
end