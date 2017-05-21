# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "boombox/version"

Gem::Specification.new do |spec|
  spec.name          = "boombox"
  spec.version       = Boombox::VERSION
  spec.authors       = ["Rob Hesketh"]
  spec.email         = ["contact@robhesketh.com"]

  spec.summary       = "An incredibly tiny Shoutcast server that can be embedded into Ruby applications."
  spec.homepage      = "http://github.com/RHesketh/boombox"
  spec.license       = "Unlicense"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-spec", "~> 0.0.2"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "mocha", "~> 1.2.1"
end
