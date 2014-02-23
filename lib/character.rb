require 'lib/character/ability_scores'
require 'lib/character/armor_class'
require 'lib/character/races'
require 'lib/character/saving_throws'
require 'lib/character/skills'

class Character
  include Character::AbilityScores

  attr_reader :armor_class, :saving_throws

  def initialize
    extend Character::Race::Empty
    extend Character::Skills

    @armor_class = ArmorClass.new(self)
    @saving_throws = SavingThrows.new(self)
  end

  def set_race(race_name)
    race_class_name = race_name.to_s.camelize.to_sym

    available_races = Race.list_available

    unless available_races.include? race_class_name
      raise ArgumentError.new("Wrong race name, choose one of the following: #{available_races}")
    end

    extend "Character::Race::#{race_class_name}".constantize
  end
end
