# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xpitality/notifier/version'

Gem::Specification.new do |spec|
  spec.name          = 'xpitality-notifier'
  spec.version       = Xpitality::Notifier::VERSION
  spec.authors       = ['Marko Bošković']
  spec.email         = ['bosskovic@gmail.com']
  spec.summary       = ' Provides a set of configurable notifiers for xpitality apps.'
  spec.description   = ' Provides a set of configurable notifiers for xpitality apps.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'slack-notify'
  spec.add_development_dependency 'nexmo'
  spec.add_development_dependency 'bugsnag'
end
