class Character
  module Skill
    class Base
      attr_accessor :rank
      attr_reader :ability, :character, :classes, :label

      def initialize(character)
        @character = character

        @rank = 0
        @ability = configuration['ability']

        set_classes(configuration['classes'])
      end

      def label
        self.class.name.demodulize.downcase
      end

      def ability_modifier
        character.public_send("#{ability}_modifier")
      end

      def class_skill?
        false
      end

      def class_modifier
        (class_skill? and rank > 0) ? 3 : 0
      end

      def total
        ability_modifier + rank + class_modifier
      end

      private

      def set_classes(classes)
        @classes = classes
      end
    end
  end
end
