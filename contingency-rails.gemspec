# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contingency/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "contingency-rails"
  spec.version       = Contingency::Adapters::Rails::VERSION
  spec.authors       = ["Christopher Keele"]
  spec.email         = ["dev@chriskeele.com"]
  spec.description   = "Contingency integration for Rails."
  spec.summary       = "Contingency-Rails provides controller exception catching and routes to your custom error pages."
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "contingency", ">= 0.2.0"
  spec.add_dependency "rails",       ">= 4.0.0.beta"

  spec.add_development_dependency "bundler", "~> 1.3"
end
