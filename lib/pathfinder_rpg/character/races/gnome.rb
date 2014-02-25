class Character
  module Race
    module Gnome
      extend Character::Size::Small

      def race
        Character::Race::Gnome
      end
    end
  end
end
