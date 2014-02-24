class Character
  class Attack
    def initialize(character)
      @character = character
    end

    def available_attacks
      @character.klasses.map(&:available_attacks).max
    end

    def base_attack_bonus(attack_number = 1)
      @character.klasses.map do |klass|
        klass.base_attack_bonus(attack_number)
      end.inject(:+)
    end

    def melee(attack_number = 1)
      base_attack_bonus(attack_number) +
      @character.strength_modifier +
      @character.race.size.modifier
    end

    def ranged(attack_number = 1)
      base_attack_bonus(attack_number) +
      @character.dexterity_modifier +
      @character.race.size.modifier
    end

    def combat_maneuver_bonus(attack_number = 1)
      base_attack_bonus(attack_number) +
      @character.strength_modifier +
      @character.race.size.special_modifier
    end

    def combat_maneuver_defense(attack_number = 1)
      base_attack_bonus(attack_number) +
      @character.strength_modifier +
      @character.dexterity_modifier +
      @character.race.size.special_modifier
    end
  end
end
