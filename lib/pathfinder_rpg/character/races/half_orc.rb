class PathfinderRpg::Character
  module Race
    module HalfOrc
      extend PathfinderRpg::Character::Size::Medium

      def race
        PathfinderRpg::Character::Race::HalfOrc
      end
    end
  end
end
