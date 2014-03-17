module PathfinderRpg
  class Character
    module Race
      module Gnome
        extend PathfinderRpg::Character::Size::Small

        def race
          PathfinderRpg::Character::Race::Gnome
        end

        def charisma
          super + 2
        end

        def constitution
          super + 2
        end

        def strength
          super - 2
        end
      end
    end
  end
end
