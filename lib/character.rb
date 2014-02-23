require 'character/ability_scores'
require 'character/armor_class'
require 'character/saving_throws'

class Character
  include Character::AbilityScores

  attr_reader :armor_class, :saving_throws

  def initialize
    @armor_class = ArmorClass.new(self)
    @saving_throws = SavingThrows.new(self)
  end
end
