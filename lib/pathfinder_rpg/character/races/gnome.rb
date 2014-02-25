class PathfinderRpg::Character
  module Race
    module Gnome
      extend PathfinderRpg::Character::Size::Small

      def race
        PathfinderRpg::Character::Race::Gnome
      end
    end
  end
end
