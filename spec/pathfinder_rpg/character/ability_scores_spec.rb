describe PathfinderRpg::Character::AbilityScores do
  subject { PathfinderRpg::Character.new }

  before do
    subject.charisma = 10
    subject.constitution = 6
    subject.dexterity = 24
    subject.intelligence = 0
    subject.strength = -99
    subject.wisdom = 60
  end

  describe '#charisma_modifier' do
    specify { expect(subject.charisma_modifier).to eql 0 }
  end

  describe '#constitution_modifier' do
    specify { expect(subject.constitution_modifier).to eql -2 }
  end

  describe '#dexterity_modifier' do
    specify { expect(subject.dexterity_modifier).to eql 7 }
  end

  describe '#intelligence_modifier' do
    specify { expect(subject.intelligence_modifier).to eql -5 }
  end

  describe '#strength_modifier' do
    specify { expect(subject.strength_modifier).to eql -5 }
  end

  describe '#wisdom_modifier' do
    specify { expect(subject.wisdom_modifier).to eql 17 }
  end
end
