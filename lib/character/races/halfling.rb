class Character
  module Race
    module Halfling
      extend Character::Size::Small

      def race
        Character::Race::Halfling
      end
    end
  end
end
