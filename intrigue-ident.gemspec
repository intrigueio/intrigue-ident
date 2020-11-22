# encoding: utf-8
require File.expand_path("../lib/version", __FILE__)

# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "intrigue-ident"
  spec.version       = Ident::VERSION
  spec.authors       = ["jcran"]
  spec.email         = ["jcran@intrigue.io"]

  spec.summary       = %q{Intrigue Asset Fingerprinting Library}
  spec.description   = %q{Intrigue Asset Fingerprinting Library}
  spec.homepage      = "https://intrigue.io"
  spec.license       = "BSD-3-Clause"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  
  spec.add_runtime_dependency "dnsruby"
  spec.add_runtime_dependency "recog-intrigue"
  spec.add_runtime_dependency "socketry"
  spec.add_runtime_dependency "snmp"
  spec.add_runtime_dependency "typhoeus"
  spec.add_runtime_dependency "murmurhash3"
  
  
end
