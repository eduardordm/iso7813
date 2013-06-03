# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iso7813/version'

Gem::Specification.new do |gem|

  gem.add_development_dependency "rspec"
  gem.add_dependency 'iso7812'

  gem.name          = "iso7813"
  gem.version       = Iso7813::VERSION
  gem.authors       = ["Eduardo Mourao"]
  gem.email         = ["eduardo.a20@gmail.com"]
  gem.description   = %q{Implementation of the ISO/IEC 7813 standard}
  gem.summary       = %q{Implementation of the ISO/IEC 7813 standard}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
