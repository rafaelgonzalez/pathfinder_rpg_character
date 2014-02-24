class Character
  module Race
    module HalfElf
      extend Character::Size::Medium

      def race
        Character::Race::HalfElf
      end
    end
  end
end
