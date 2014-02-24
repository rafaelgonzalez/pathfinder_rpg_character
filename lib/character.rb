require 'lib/character/ability_scores'
require 'lib/character/armor_class'
require 'lib/character/klasses'
require 'lib/character/races'
require 'lib/character/saving_throws'
require 'lib/character/skills'

class Character
  include Character::AbilityScores

  attr_reader :armor_class, :saving_throws

  def initialize
    extend Character::Races
    extend Character::Klasses
    extend Character::Skills

    @armor_class = ArmorClass.new(self)
    @saving_throws = SavingThrows.new(self)
  end
end
