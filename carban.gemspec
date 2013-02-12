# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carban/version'

Gem::Specification.new do |gem|
  gem.name          = "carban"
  gem.version       = Carban::VERSION
  gem.authors       = ["patrick"]
  gem.email         = ["patrick@patrickjones.ca"]
  gem.description   = %q{A Virtual Machine implemented as Abstract Stack Machine and Abstract Register Machine}
  gem.summary       = %q{Virtual Machine implementations of the Carban Instruction Set}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
