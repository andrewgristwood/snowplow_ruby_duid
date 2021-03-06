# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snowplow_ruby_duid/version'

Gem::Specification.new do |spec|
  spec.name          = 'snowplow_ruby_duid'
  spec.version       = SnowplowRubyDuid::VERSION
  spec.authors       = ['Simply Business']
  spec.email         = ['tech@simplybusiness.co.uk']
  spec.description   = 'A gem that exposes the Snowplow domain userid in Rack applications. Also allows you to set your own domain userid that will be shared with the Snowplow Javascript tracker.'
  spec.summary       = 'A gem that exposes the Snowplow domain userid in Rack applications. Also allows you to set your own domain userid that will be shared with the Snowplow Javascript tracker.'
  spec.homepage      = 'https://github.com/simplybusiness/snowplow_ruby_duid'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rack', '~> 2.0'
  spec.add_development_dependency 'rack-test', '~> 0.6'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 0.46'
  spec.add_development_dependency 'rutabaga', '~> 2.1'
  spec.add_development_dependency 'timecop', '~> 0.8'
end
