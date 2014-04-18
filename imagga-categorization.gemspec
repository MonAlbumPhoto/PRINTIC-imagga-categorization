# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imagga/categorization/version'

Gem::Specification.new do |spec|
  spec.name          = "imagga-categorization"
  spec.version       = Imagga::Categorization::VERSION
  spec.authors       = ["Benjamin Grelié"]
  spec.email         = ["benjamin@printicapp.com"]
  spec.description   = %q{Ruby client for accessing Imagga categorization & training API}
  spec.summary       = %q{Ruby client for accessing Imagga categorization & training API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
