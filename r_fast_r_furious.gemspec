# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'r_fast_r_furious/version'

Gem::Specification.new do |spec|
  spec.name          = "r_fast_r_furious"
  spec.version       = RFastRFurious::VERSION
  spec.authors       = ["Tim Carey-Smith"]
  spec.email         = ["tim@spork.in"]
  spec.description   = %q{easily validate movie titles from the fast and the furious saga}
  spec.summary       = %q{sometimes you just don't have enough time to read}
  spec.homepage      = "https://github.com/halorgium/r_fast_r_furious"
  spec.license       = "Public Domain"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "therubyracer"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
