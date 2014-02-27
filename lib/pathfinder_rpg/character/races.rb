require 'pathfinder_rpg/character/sizes'

require 'pathfinder_rpg/character/races/dwarf'
require 'pathfinder_rpg/character/races/elf'
require 'pathfinder_rpg/character/races/empty'
require 'pathfinder_rpg/character/races/gnome'
require 'pathfinder_rpg/character/races/half_elf'
require 'pathfinder_rpg/character/races/half_orc'
require 'pathfinder_rpg/character/races/halfling'
require 'pathfinder_rpg/character/races/human'

module PathfinderRpg
  class Character
    module Races
      include Race

      def self.extended(character)
        character.instance_exec do
          extend PathfinderRpg::Character::Race::Empty
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

        extend "PathfinderRpg::Character::Race::#{race_class_name}".constantize
      end
    end
  end
end
