# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'record_roo/version'

Gem::Specification.new do |spec|
  spec.name          = "record_roo"
  spec.version       = RecordRoo::VERSION
  spec.authors       = ["Daniel Martinez"]
  spec.email         = ["eduardodaniel2@gmail.com"]
  spec.description   = %q{Easy object mapping from spreadsheets}
  spec.summary       = %q{It provides a way to obtain an object that wraps a row within a spreadsheet}
  spec.homepage      = "http://ochobits.org"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
