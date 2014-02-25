class PathfinderRpg::Character
  module Race
    module Elf
      extend PathfinderRpg::Character::Size::Medium

      def race
        PathfinderRpg::Character::Race::Elf
      end
    end
  end
end
