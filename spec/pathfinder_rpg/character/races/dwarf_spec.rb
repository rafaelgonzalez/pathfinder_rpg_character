require 'spec_helper'

describe PathfinderRpg::Character::Race::Dwarf do
  subject { PathfinderRpg::Character.new }
  before { subject.set_race(:dwarf) }

  describe '.size' do
    specify { expect(subject.race.size).to eql PathfinderRpg::Character::Size::Medium }
  end

  describe '#race' do
    specify { expect(subject.race).to eql PathfinderRpg::Character::Race::Dwarf }
  end

  describe '#charisma' do
    specify { expect(subject.charisma).to eql -2 }
  end

  describe '#constitution' do
    specify { expect(subject.constitution).to eql 2 }
  end

  describe '#wisdom' do
    specify { expect(subject.wisdom).to eql 2 }
  end
end
