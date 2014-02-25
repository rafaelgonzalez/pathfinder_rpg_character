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

    def natural_bonus
      0
    end

    def size_bonus
      @character.race.size.modifier
    end

    def deflection_bonus
      0
    end

    def dexterity_bonus
      @character.dexterity_modifier
    end

    def dodge_bonus
      0
    end

    def touch
      total - armor_bonus - shield_bonus - natural_bonus
    end

    def flat_footed
      total - dexterity_bonus - dodge_bonus
    end

    def total
      BASE_ARMOR_CLASS +
      armor_bonus +
      shield_bonus +
      natural_bonus +
      size_bonus +
      deflection_bonus +
      dexterity_bonus +
      dodge_bonus
    end
  end
end
