class Character
  class SavingThrows

    def initialize(character)
      @character = character
    end

    def fortitude
      @character.constitution_modifier
    end

    def reflex
      @character.dexterity_modifier
    end

    def will
      @character.wisdom_modifier
    end
  end
end
