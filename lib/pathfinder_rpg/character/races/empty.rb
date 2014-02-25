class PathfinderRpg::Character
  module Race
    module Empty
      extend PathfinderRpg::Character::Size::Empty

      def race
        PathfinderRpg::Character::Race::Empty
      end
    end
  end
end
