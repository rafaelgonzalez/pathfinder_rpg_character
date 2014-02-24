require 'lib/character/sizes'

require 'lib/character/races/dwarf'
require 'lib/character/races/elf'
require 'lib/character/races/empty'
require 'lib/character/races/gnome'
require 'lib/character/races/half_elf'
require 'lib/character/races/half_orc'
require 'lib/character/races/halfling'
require 'lib/character/races/human'

class Character
  module Races
    include Race

    def self.extended(character)
      character.instance_exec do
        extend Character::Race::Empty
      end
    end

    def self.available
      Race.constants.select do |const|
        Race.const_get(const).is_a? Module
      end
    end

    def set_race(race_name)
      race_class_name = race_name.to_s.camelize.to_sym

      available_races = Races.available

      unless available_races.include? race_class_name
        raise ArgumentError.new("Wrong race name, choose one of the following: #{available_races}")
      end

      extend "Character::Race::#{race_class_name}".constantize
    end
  end
end
