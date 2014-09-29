require 'pathfinder_rpg/character/ability_scores'
require 'pathfinder_rpg/character/armor_class'
require 'pathfinder_rpg/character/attack'
require 'pathfinder_rpg/character/klass'
require 'pathfinder_rpg/character/races'
require 'pathfinder_rpg/character/saving_throws'
require 'pathfinder_rpg/character/skills'

module PathfinderRpg
  class Character
    include PathfinderRpg::Character::AbilityScores
    include PathfinderRpg::Character::Klass::Include
    include PathfinderRpg::Character::Skills::Model

    attr_reader :armor_class, :attack, :saving_throws

    def initialize
      extend PathfinderRpg::Character::Races

      @charisma = 0
      @constitution = 0
      @dexterity = 0
      @intelligence = 0
      @strength = 0
      @wisdom = 0

      @klasses = []

      @armor_class = ArmorClass.new(self)
      @attack = Attack.new(self)
      @saving_throws = SavingThrows.new(self)

      Skills.add_skills_to_character(self)
    end
  end
end
