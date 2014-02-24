class Character
  module Race
    module Dwarf
      extend Character::Size::Medium

      def race
        Character::Race::Dwarf
      end
    end
  end
end
