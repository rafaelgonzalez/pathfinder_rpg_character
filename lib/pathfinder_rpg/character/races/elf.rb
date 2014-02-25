class Character
  module Race
    module Elf
      extend Character::Size::Medium

      def race
        Character::Race::Elf
      end
    end
  end
end
