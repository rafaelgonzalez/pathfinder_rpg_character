module PathfinderRpg
  class Character
    module Race
      module Dwarf
        extend PathfinderRpg::Character::Size::Medium

        def race
          PathfinderRpg::Character::Race::Dwarf
        end

        def charisma
          super - 2
        end

        def constitution
          super + 2
        end

        def wisdom
          super + 2
        end
      end
    end
  end
end
