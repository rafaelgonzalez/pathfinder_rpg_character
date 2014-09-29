module PathfinderRpg
  class Character
    module Klass
      class Base
        attr_accessor :level
        attr_accessor :favored

        def initialize(character, level = 1, favored = false)
          @character = character
          @level = level
          @favored = favored
        end

        def self.label
          name.demodulize.downcase
        end

        def label
          self.class.label
        end

        def self.available_alignments
          raise NotImplementedError.new('You either tried to instantiate Klass::Base or Klass.init! was not called.')
        end

        def available_alignments
          self.class.available_alignments
        end

        def self.skill_ranks_per_level
          raise NotImplementedError.new('You either tried to instantiate Klass::Base or Klass.init! was not called.')
        end

        def skill_ranks_per_level
          self.class.skill_ranks_per_level
        end

        def skills_per_level
          skill_ranks_per_level + @character.intelligence_modifier
        end

        def self.hit_die
          raise NotImplementedError.new('You either tried to instantiate Klass::Base or Klass.init! was not called.')
        end

        def hit_die
          self.class.hit_die
        end

        def base_attack_bonus(attack_number = 1)
          raise ArgumentError.new('Not a valid attack number') unless attack_number > 0
          level_bonus_for('base_attack_bonus').at(attack_number - 1) || 0
        end

        def available_attacks
          level_bonus_for('base_attack_bonus').size
        end

        def fortitude_save_base
          level_bonus_for('fortitude_save')
        end

        def reflex_save_base
          level_bonus_for('reflex_save')
        end

        def will_save_base
          level_bonus_for('will_save')
        end

        private

        def level_bonus_for(key)
          self.class::LEVELS[level][key]
        end
      end
    end
  end
end
