# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pathfinder_rpg/version'

Gem::Specification.new do |spec|
  spec.name          = 'pathfinder_rpg_character'
  spec.version       = PathfinderRpg::VERSION
  spec.authors       = ['Rafaël Gonzalez']
  spec.email         = 'github@rafaelgonzalez.me'
  spec.summary       = %q{Pathfinder character generator gem.}
  spec.description   = %q{Pathfinder Rpg Character is designed to help create Pathfinder characters programatically handling as many core rules as possible.}
  spec.homepage      = 'https://github.com/rafaelgonzalez/pathfinder_rpg_character'
  spec.licenses      = ['MIT', 'Open Game License']

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport', '~> 4.1.6'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'fivemat', '~> 1.3.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'simplecov', '~> 0.9.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.0'
end
