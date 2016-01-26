# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clientele/http/version'

Gem::Specification.new do |spec|
  spec.name          = "clientele-http"
  spec.version       = Clientele::HTTP::VERSION
  spec.authors       = ["Chris Keele"]
  spec.email         = ["dev@chriskeele.com"]

  spec.summary       = "Value objects for leveraging the HTTP protocol in Ruby."
  spec.description   = "Contains a variety of classes, registries, and interfaces for most HTTP operations."
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "addressable", "~> 2.4.0"

  spec.add_development_dependency "bundler", "> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec",   "~> 3.0"
end
