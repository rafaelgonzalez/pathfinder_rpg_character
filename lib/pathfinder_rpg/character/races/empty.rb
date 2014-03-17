module PathfinderRpg
  class Character
    module Race
      module Empty
        extend PathfinderRpg::Character::Size::Empty

        def race
          PathfinderRpg::Character::Race::Empty
        end
      end
    end
  end
end
