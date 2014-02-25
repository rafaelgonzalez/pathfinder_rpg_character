class PathfinderRpg::Character
  module Skill
    class Base
      attr_accessor :rank
      attr_reader :ability, :character, :trained_klasses, :label

      def initialize(character)
        @character = character

        @rank = 0
        @ability = configuration['ability']

        set_trained_klasses(configuration['classes'])
      end

      def label
        self.class.name.demodulize.downcase
      end

      def ability_modifier
        character.public_send("#{ability}_modifier")
      end

      def klass_skill?
        @character.klasses.any?{|klass| klasses.include? klass }
      end

      def skill_for_klass?(klass)

      end

      def klass_modifier
        (klass_skill? and rank > 0) ? 3 : 0
      end

      def total
        ability_modifier + rank + klass_modifier
      end

      private

      def set_trained_klasses(klasses_names)
        @trained_klasses = []

        klasses_names.each do |klass_name|
          @trained_klasses.push "PathfinderRpg::Character::Klass::#{klass_name.camelize}".constantize
        end
      end
    end
  end
end
