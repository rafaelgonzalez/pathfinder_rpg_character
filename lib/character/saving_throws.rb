class Character
  class SavingThrows
    def initialize(character)
      @character = character
    end

    def fortitude
      @character.constitution_modifier + @character.klasses.map(&:fortitude_save_base).inject(:+)
    end

    def reflex
      @character.dexterity_modifier + @character.klasses.map(&:reflex_save_base).inject(:+)
    end

    def will
      @character.wisdom_modifier + @character.klasses.map(&:will_save_base).inject(:+)
    end
  end
end
