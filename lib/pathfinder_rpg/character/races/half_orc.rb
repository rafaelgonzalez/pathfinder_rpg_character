class Character
  module Race
    module HalfOrc
      extend Character::Size::Medium

      def race
        Character::Race::HalfOrc
      end
    end
  end
end
