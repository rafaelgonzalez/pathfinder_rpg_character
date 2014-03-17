module PathfinderRpg
  class Character
    module Race
      module Halfling
        extend PathfinderRpg::Character::Size::Small

        def race
          PathfinderRpg::Character::Race::Halfling
        end

        def charisma
          super + 2
        end

        def dexterity
          super + 2
        end

        def strength
          super - 2
        end
      end
    end
  end
end
