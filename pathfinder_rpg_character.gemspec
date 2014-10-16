Gem::Specification.new do |s|
  s.name        = 'pathfinder_rpg_character'
  s.version     = '0.0.0'
  s.date        = '2014-02-23'
  s.summary     = 'Pathfinder character generator gem'
  s.authors     = ['Rafaël Gonzalez']
  s.email       = 'rafaelgonzalez@users.noreply.github.com'
  s.files       = ['lib/pathfinder_rpg.rb']
  s.homepage    = 'http://rubygems.org/gems/pathfinder_rpg_character'
  s.license     = 'Open game license'

  s.add_runtime_dependency 'activesupport', '>= 3.0'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'simplecov'
end
