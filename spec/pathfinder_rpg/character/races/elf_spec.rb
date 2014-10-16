describe PathfinderRpg::Character::Race::Elf do
  subject { PathfinderRpg::Character.new }
  before { subject.set_race(:elf) }

  describe '.size' do
    specify { expect(subject.race.size).to eql PathfinderRpg::Character::Size::Medium }
  end

  describe '#race' do
    specify { expect(subject.race).to eql PathfinderRpg::Character::Race::Elf }
  end

  describe '#constitution' do
    specify { expect(subject.constitution).to eql -2 }
  end

  describe '#dexterity' do
    specify { expect(subject.dexterity).to eql 2 }
  end

  describe '#intelligence' do
    specify { expect(subject.intelligence).to eql 2 }
  end
end
