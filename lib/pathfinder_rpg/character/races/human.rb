class PathfinderRpg::Character
  module Race
    module Human
      extend PathfinderRpg::Character::Size::Medium

      def race
        PathfinderRpg::Character::Race::Human
      end
    end
  end
end
