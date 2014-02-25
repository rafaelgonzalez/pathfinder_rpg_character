class Character
  class ArmorClass

    BASE_ARMOR_CLASS = 10

    def initialize(character)
      @character = character
    end

    # @!group Modifiers

    # Returns the armor bonus applied to the armor class.
    #
    # @todo Not implemented.
    # @return [Fixnum] the applied armor bonus.
    def armor_bonus
      0
    end

    # Returns the shield bonus applied to the armor class.
    #
    # @todo Not implemented.
    # @return [Fixnum] the applied shield bonus.
    def shield_bonus
      0
    end

    # Returns the natural bonus applied to the armor class.
    #
    # @todo Not implemented.
    # @return [Fixnum] the applied natural bonus.
    def natural_bonus
      0
    end

    # Returns the size bonus applied to the armor class.
    #
    # @return [Fixnum] the applied size bonus.
    def size_bonus
      @character.race.size.modifier
    end

    # Returns the deflection bonus applied to the armor class.
    #
    # @todo Not implemented.
    # @return [Fixnum] the applied deflection bonus.
    def deflection_bonus
      0
    end

    # Returns the dexterity bonus applied to the armor class.
    #
    # @return [Fixnum] the applied dexterity bonus.
    def dexterity_bonus
      @character.dexterity_modifier
    end

    # Returns the dodge bonus applied to the armor class.
    #
    # @todo Not implemented.
    # @return [Fixnum] the applied dodge bonus.
    def dodge_bonus
      0
    end

    # @!group Totals

    # @return [Fixnum] the touch armor class.
    def touch
      total - armor_bonus - shield_bonus - natural_bonus
    end

    # @return [Fixnum] the flat-footed armor class.
    def flat_footed
      total - dexterity_bonus - dodge_bonus
    end

    # @return [Fixnum] the total armor class.
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
