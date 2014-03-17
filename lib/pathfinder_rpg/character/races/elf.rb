module PathfinderRpg
  class Character
    module Race
      module Elf
        extend PathfinderRpg::Character::Size::Medium

        def race
          PathfinderRpg::Character::Race::Elf
        end

        def constitution
          super - 2
        end

        def dexterity
          super + 2
        end

        def intelligence
          super + 2
        end
      end
    end
  end
end
