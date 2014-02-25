class PathfinderRpg::Character
  module Race
    module Dwarf
      extend PathfinderRpg::Character::Size::Medium

      def race
        PathfinderRpg::Character::Race::Dwarf
      end
    end
  end
end
