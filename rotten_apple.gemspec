# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rotten_apple/version'

Gem::Specification.new do |gem|
  gem.name          = "rotten_apple"
  gem.version       = RottenApple::VERSION
  gem.authors       = ["Jonathan Claudius"]
  gem.email         = ["claudijd@yahoo.com"]
  gem.description   = %q{A ruby project for testing CI/Build Environments}
  gem.summary       = %q{A ruby project for testing CI/Build Environments}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
