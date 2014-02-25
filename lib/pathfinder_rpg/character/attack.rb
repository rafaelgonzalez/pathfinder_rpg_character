class PathfinderRpg::Character
  class Attack
    def initialize(character)
      @character = character
    end

    # Returns the number of available attacks in a single attack turn.
    #
    # @return [Fixnum] the number of available attacks.
    def available_attacks
      @character.klasses.map(&:available_attacks).max
    end

    # Returns the base attack bonus for a given attack.
    #
    # @param attack_number [Fixnum] the number of the attack during the turn.
    # @return [Fixnum] the base attack bonus.
    def base_attack_bonus(attack_number = 1)
      @character.klasses.map do |klass|
        klass.base_attack_bonus(attack_number)
      end.sum
    end

    # Returns the melee bonus for a given attack.
    #
    # @param attack_number [Fixnum] the number of the attack during the turn.
    # @return [Fixnum] the melee bonus.
    def melee_bonus(attack_number = 1)
      base_attack_bonus(attack_number) +
      @character.strength_modifier +
      @character.race.size.modifier
    end

    # Returns the ranged bonus for a given attack.
    #
    # @param attack_number [Fixnum] the number of the attack during the turn.
    # @return [Fixnum] the ranged bonus.
    def ranged_bonus(attack_number = 1)
      base_attack_bonus(attack_number) +
      @character.dexterity_modifier +
      @character.race.size.modifier
    end

    # Returns the combat maneuver bonus for a given attack.
    #
    # @param attack_number [Fixnum] the number of the attack during the turn.
    # @return [Fixnum] the combat maneuver bonus bonus.
    def combat_maneuver_bonus(attack_number = 1)
      base_attack_bonus(attack_number) +
      @character.strength_modifier +
      @character.race.size.special_modifier
    end

    # Returns the combat maneuver defense for a given attack.
    #
    # @param attack_number [Fixnum] the number of the attack during the turn.
    # @return [Fixnum] the combat maneuver defense bonus.
    def combat_maneuver_defense(attack_number = 1)
      base_attack_bonus(attack_number) +
      @character.strength_modifier +
      @character.dexterity_modifier +
      @character.race.size.special_modifier
    end
  end
end
