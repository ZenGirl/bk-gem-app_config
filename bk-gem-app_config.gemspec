# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bk/gem/app_config/version'

Gem::Specification.new do |spec|
  spec.name        = 'ld-gem-app_config'
  spec.version     = BK::Gem::App::Config::VERSION
  spec.authors     = ['Kimberley Scott']
  spec.email       = ['kscott@localdirectories.com.au']
  spec.summary     = %q{Global configuration options}
  spec.description = %q{Global configuration options}
  spec.homepage    = ''
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'hashie'

end
