require 'spec_helper'

describe PathfinderRpg::Character::Race::Halfling do
  subject { PathfinderRpg::Character.new }
  before { subject.set_race(:halfling) }

  describe '.size' do
    specify { expect(subject.race.size).to eql PathfinderRpg::Character::Size::Small }
  end

  describe '#race' do
    specify { expect(subject.race).to eql PathfinderRpg::Character::Race::Halfling }
  end

  describe '#charisma' do
    specify { expect(subject.charisma).to eql 2 }
  end

  describe '#dexterity' do
    specify { expect(subject.dexterity).to eql 2 }
  end

  describe '#strength' do
    specify { expect(subject.strength).to eql -2 }
  end
end
