# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_processor/version'

Gem::Specification.new do |spec|
  spec.name          = 'simple_processor'
  spec.version       = SimpleProcessor::VERSION
  spec.authors       = ['David Saenz Tagarro']
  spec.email         = ['david.saenz.tagarro@gmail.com']
  spec.summary       = %q{Rails data batch migrations made easy.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ruby-progressbar'

  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'cane'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'factory_girl'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'sinatra'
  spec.add_development_dependency 'sinatra-activerecord'
  spec.add_development_dependency 'simplecov'
end
