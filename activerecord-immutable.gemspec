# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/immutable/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-immutable"
  spec.version       = ActiveRecord::Immutable::VERSION
  spec.authors       = ["Matt Rohrer"]
  spec.email         = ["matt@prognostikos.com"]
  spec.summary       = %q{A tiny mixin to make your ActiveRecord models immutable.}
  spec.description   = %q{Include ActiveRecord::Immutable in your ActiveRecord models to make your tables append-only.}
  spec.homepage      = "https://github.com/prognostikos/activerecord-immutable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord", ">= 3.2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "railties"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "sqlite3"
end
