class Character
  module Skill
    class Base
      attr_accessor :rank
      attr_reader :ability, :character, :klasses, :label

      def initialize(character)
        @character = character

        @rank = 0
        @ability = configuration['ability']

        set_klasses(configuration['classes'])
      end

      def label
        self.class.name.demodulize.downcase
      end

      def ability_modifier
        character.public_send("#{ability}_modifier")
      end

      def klass_skill?(klass)
        false
      end

      def klass_modifier
        (klass_skill? and rank > 0) ? 3 : 0
      end

      def total
        ability_modifier + rank + klass_modifier
      end

      private

      def set_classes(klasses)
        klasses = klasses
      end
    end
  end
end
