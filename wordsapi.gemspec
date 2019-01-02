# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wordsapi/version'

Gem::Specification.new do |spec|
  spec.name = 'wordsapi'
  spec.version = WordsAPI::Version
  spec.authors = ['Nardo Nykolyszyn']
  spec.email = ['devpolish@protonmail.com']
  spec.summary = 'Words API gem'
  spec.description = 'A Ruby interface to the Words API'
  spec.homepage = 'https://github.com/devpolish/wordsapi'
  spec.license = 'MIT'

  spec.files = %w[LICENSE.txt README.md Rakefile wordsapi.gemspec]
  spec.files += Dir.glob('lib/**/*.rb')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir.glob('test/**/*')
  spec.require_paths = ['lib']
  spec.required_rubygems_version = '>= 1.3.5'

  # Development dependencies
  spec.add_development_dependency 'bundler',  '~> 1.5'
  spec.add_development_dependency 'rake',     '~> 0'
  spec.add_development_dependency 'rspec',    '~> 3.3.0'

  # Productions dependencies
  spec.add_dependency 'faraday', '~> 0.9.0'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'json'
  spec.add_dependency 'request_id'
end
