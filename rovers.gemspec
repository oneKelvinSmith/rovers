# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rovers/version'

Gem::Specification.new do |spec|
  spec.name          = "rovers"
  spec.version       = Rovers::VERSION
  spec.authors       = ["Kelvin Smith"]
  spec.email         = ["oneKelvinSmith@gmail.com"]
  spec.description   = %q{ThoughtWorks Mars Rovers - Solution}
  spec.summary       = %q{Solution to ThoughtWorks Problem of Mars Rovers mapping out a rectangular plateau}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
