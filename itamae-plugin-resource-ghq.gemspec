# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/resource/ghq/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-resource-ghq"
  spec.version       = Itamae::Plugin::Resource::Ghq::VERSION
  spec.authors       = ["Takashi Kokubun"]
  spec.email         = ["takashikkbn@gmail.com"]
  spec.summary       = %q{Itamae resource plugin to manage repositories with ghq.}
  spec.description   = %q{Itamae resource plugin to manage repositories with ghq.}
  spec.homepage      = "https://github.com/k0kubun/itamae-plugin-resource-ghq"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "itamae"
end
