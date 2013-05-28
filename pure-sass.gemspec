# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pure/sass/version'

Gem::Specification.new do |spec|
  spec.name          = "pure-sass"
  spec.version       = Pure::Sass::VERSION
  spec.authors       = ["James Harton", "Mathew Hartley"]
  spec.email         = ["james@resistor.io", "matt@route66.sytes.net"]
  spec.description   = "Yahoo's purecss ported to SASS"
  spec.summary       = "Yahoo's purecss ported to SASS"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  %w[ sass ].each do |gem|
    spec.add_dependency gem
  end

  %w[ rake rspec guard guard-rspec guard-sass guard-bundler ].each do |gem|
    spec.add_development_dependency gem
  end
  spec.add_development_dependency "bundler", "~> 1.3"
end
