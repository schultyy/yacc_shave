# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yacc_shave/version'

Gem::Specification.new do |spec|
  spec.name          = "yacc_shave"
  spec.version       = YaccShave::VERSION
  spec.authors       = ["Jan Schulte"]
  spec.email         = ["hello@unexpected-co.de"]
  spec.summary       = %q{Shaving yaccs}
  spec.description   = %q{Shaving yaccs}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rexical"
  spec.add_runtime_dependency "racc"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
