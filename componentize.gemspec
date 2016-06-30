# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'componentize/version'

Gem::Specification.new do |spec|
  spec.name          = "componentize"
  spec.version       = Componentize::VERSION
  spec.authors       = ["Kyle Shevlin"]
  spec.email         = ["kyle.a.shevlin@gmail.com"]
  spec.summary       = %q{Generator for inline and block level Rails components. Similar to Ember's component generator.}
  spec.description   = %q{Generator for inline and block level Rails components. Similar to Ember's component generator.}
  spec.homepage      = "https://github.com/kyleshevlin/componentize"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails", ">= 3.1"
end
