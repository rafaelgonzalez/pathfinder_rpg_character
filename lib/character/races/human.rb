class Character
  module Race
    module Human
      extend Character::Size::Small

      def race
        Character::Race::Human
      end
    end
  end
end
