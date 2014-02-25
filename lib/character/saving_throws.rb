class Character
  class SavingThrows
    def initialize(character)
      @character = character
    end

    # @return [Fixnum] the fortitude saving throw.
    def fortitude
      @character.constitution_modifier + @character.klasses.map(&:fortitude_save_base).inject(:+)
    end

    # @return [Fixnum] the reflex saving throw.
    def reflex
      @character.dexterity_modifier + @character.klasses.map(&:reflex_save_base).inject(:+)
    end

    # @return [Fixnum] the will saving throw.
    def will
      @character.wisdom_modifier + @character.klasses.map(&:will_save_base).inject(:+)
    end
  end
end
