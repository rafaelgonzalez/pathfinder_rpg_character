class Character
  class ArmorClass

    BASE_ARMOR_CLASS = 10

    def initialize(character)
      @character = character
    end

    def armor_bonus
      0
    end

    def shield_bonus
      0
    end

    def deflection
      0
    end

    def size_modifier
      @charcter.size.modifier
    end

    def other_modifiers
      0
    end

    def touch
      BASE_ARMOR_CLASS + @character.dexterity_modifier + other_modifiers
    end

    def flat_footed
      BASE_ARMOR_CLASS + armor_bonus + shield_bonus + other_modifiers
    end

    def total
      BASE_ARMOR_CLASS + armor_bonus + shield_bonus + @character.dexterity_modifier + other_modifiers
    end
  end
end
