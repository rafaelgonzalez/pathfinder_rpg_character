module PathfinderRpg
  class Character
    module Race
      module HalfElf
        extend PathfinderRpg::Character::Size::Medium

        def race
          PathfinderRpg::Character::Race::HalfElf
        end
      end
    end
  end
end
