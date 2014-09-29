require 'spec_helper'

describe PathfinderRpg::Character::Klass do
  describe '.init!' do
    it 'adds classes to Klass namespace' do
      expect(PathfinderRpg::Character::Klass.const_defined?('Barbarian')).to be true
      expect(PathfinderRpg::Character::Klass.const_defined?('Bard')).to be true
      expect(PathfinderRpg::Character::Klass.const_defined?('Cleric')).to be true
      expect(PathfinderRpg::Character::Klass.const_defined?('Druid')).to be true
      expect(PathfinderRpg::Character::Klass.const_defined?('Fighter')).to be true
      expect(PathfinderRpg::Character::Klass.const_defined?('Monk')).to be true
      expect(PathfinderRpg::Character::Klass.const_defined?('Paladin')).to be true
      expect(PathfinderRpg::Character::Klass.const_defined?('Ranger')).to be true
      expect(PathfinderRpg::Character::Klass.const_defined?('Rogue')).to be true
      expect(PathfinderRpg::Character::Klass.const_defined?('Sorcerer')).to be true
      expect(PathfinderRpg::Character::Klass.const_defined?('Wizard')).to be true
    end
  end

  describe '.list_names' do
    it 'returns the names of the classes' do
      expect(PathfinderRpg::Character::Klass.list_names).to eql [
        :Barbarian, :Bard, :Cleric, :Druid, :Fighter, :Monk,
        :Paladin, :Ranger, :Rogue, :Sorcerer, :Wizard
      ]
    end
  end

  describe '.list' do
    it 'returns the constants of the classes' do
      expect(PathfinderRpg::Character::Klass.list).to eql [
        PathfinderRpg::Character::Klass::Barbarian,
        PathfinderRpg::Character::Klass::Bard,
        PathfinderRpg::Character::Klass::Cleric,
        PathfinderRpg::Character::Klass::Druid,
        PathfinderRpg::Character::Klass::Fighter,
        PathfinderRpg::Character::Klass::Monk,
        PathfinderRpg::Character::Klass::Paladin,
        PathfinderRpg::Character::Klass::Ranger,
        PathfinderRpg::Character::Klass::Rogue,
        PathfinderRpg::Character::Klass::Sorcerer,
        PathfinderRpg::Character::Klass::Wizard
     ]
    end
  end
end
