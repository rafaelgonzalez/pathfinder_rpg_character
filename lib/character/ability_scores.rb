class Character
  module AbilityScores
    # @!attribute charisma
    #   @return [Fixnum] the character's charisma.
    #
    # @!attribute constitution
    #   @return [Fixnum] the character's constitution.
    #
    # @!attribute dexterity
    #   @return [Fixnum] the character's dexterity.
    #
    # @!attribute intelligence
    #   @return [Fixnum] the character's intelligence.
    #
    # @!attribute strength
    #   @return [Fixnum] the character's strength.
    #
    # @!attribute wisdom
    #   @return [Fixnum] the character's wisdom.

    MODIFIER_MAP = {
      -Float::INFINITY..1 => -5,
      2..3 => -4,
      4..5 => -3,
      6..7 => -2,
      8..9 => -1,
      10..11 => 0,
      12..13 => 1,
      14..15 => 2,
      16..17 => 3,
      18..19 => 4,
      20..21 => 5,
      22..23 => 6,
      24..25 => 7,
      26..27 => 8,
      28..29 => 9,
      30..31 => 10,
      32..33 => 11,
      34..35 => 12,
      36..37 => 13,
      38..39 => 14,
      40..41 => 15,
      42..43 => 16,
      44..Float::INFINITY => 17,
    }

    attr_accessor :charisma, :constitution, :dexterity, :intelligence, :strength, :wisdom

    # @return [Fixnum] the charisma modifier.
    def charisma_modifier
      get_modifier_from_value(charisma)
    end

    # @return [Fixnum] the constitution modifier.
    def constitution_modifier
      get_modifier_from_value(constitution)
    end

    # @return [Fixnum] the dexterity modifier.
    def dexterity_modifier
      get_modifier_from_value(dexterity)
    end

    # @return [Fixnum] the intelligence modifier.
    def intelligence_modifier
      get_modifier_from_value(intelligence)
    end

    # @return [Fixnum] the strength modifier.
    def strength_modifier
      get_modifier_from_value(strength)
    end

    # @return [Fixnum] the wisdom modifier.
    def wisdom_modifier
      get_modifier_from_value(wisdom)
    end

    private

    def get_modifier_from_value(value)
      MODIFIER_MAP.each do |values_range, modifier|
        return modifier if values_range.cover? value
      end

      0
    end
  end
end
