require 'pathfinder_rpg/character/ability_scores'
require 'pathfinder_rpg/character/armor_class'
require 'pathfinder_rpg/character/attack'
require 'pathfinder_rpg/character/klasses'
require 'pathfinder_rpg/character/races'
require 'pathfinder_rpg/character/saving_throws'
require 'pathfinder_rpg/character/skills'

class PathfinderRpg::Character
  include PathfinderRpg::Character::AbilityScores

  attr_reader :armor_class, :attack, :saving_throws

  def initialize
    extend PathfinderRpg::Character::Races
    extend PathfinderRpg::Character::Klasses
    extend PathfinderRpg::Character::Skills

    @charisma = 0
    @constitution = 0
    @dexterity = 0
    @intelligence = 0
    @strength = 0
    @wisdom = 0

    @armor_class = ArmorClass.new(self)
    @attack = Attack.new(self)
    @saving_throws = SavingThrows.new(self)
  end
end
