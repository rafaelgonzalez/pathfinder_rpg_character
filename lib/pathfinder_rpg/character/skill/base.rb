module PathfinderRpg
  class Character
    module Skill
      class Base
        attr_accessor :rank
        attr_reader :character

        def initialize(character)
          @character = character

          @rank = 0
        end

        def self.ability
          raise RuntimeError.new('Should be implemented by calling Skills.init!')
        end

        def ability
          self.ability
        end

        def self.label
          name.demodulize.downcase
        end

        def label
          self.class.label
        end

        def self.klass_skill?(klass)
          trained_klasses.include? klass
        end

        def klass_skill?
          character.klasses.any? do |klass|
            self.class.klass_skill?(klass)
          end
        end

        def self.trained_klasses
          raise RuntimeError.new('Should be implemented by calling Skills.init!')
        end

        def trained_klasses
          self.class.trained_klasses
        end

        def self.trained_only?
          raise RuntimeError.new('Should be implemented by calling Skills.init!')
        end

        def trained_only?
          self.class.trained_only?
        end

        def ability_modifier
          character.public_send("#{ability}_modifier")
        end

        def usable?
          !trained_only? or (rank > 0)
        end

        def klass_modifier
          (klass_skill? and rank > 0) ? 3 : 0
        end

        def total
          ability_modifier + rank + klass_modifier
        end
      end
    end
  end
end
