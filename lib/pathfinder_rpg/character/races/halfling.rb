class PathfinderRpg::Character
  module Race
    module Halfling
      extend PathfinderRpg::Character::Size::Small

      def race
        PathfinderRpg::Character::Race::Halfling
      end
    end
  end
end
