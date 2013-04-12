# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contingency/adapters/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "contingency-rails"
  spec.version       = Contingency::Adapters::Rails::VERSION
  spec.authors       = ["Christopher Keele"]
  spec.email         = ["dev@chriskeele.com"]
  spec.description   = "Integration with Rails for Contingency"
  spec.summary       = "Contingency-Rails implements the simple interface defined by Contingency for easy custom Rails error pages."
  # spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # spec.add_dependency "contingency", ">= 0.1.3"
  spec.add_dependency "rails",       "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.3"
end
