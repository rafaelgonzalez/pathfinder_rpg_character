RSpec.describe PathfinderRpg::Character::Race::Gnome do
  subject { PathfinderRpg::Character.new }
  before { subject.set_race(:gnome) }

  describe '.size' do
    specify { expect(subject.race.size).to eql PathfinderRpg::Character::Size::Small }
  end

  describe '#race' do
    specify { expect(subject.race).to eql PathfinderRpg::Character::Race::Gnome }
  end

  describe '#charisma' do
    specify { expect(subject.charisma).to eql 2 }
  end

  describe '#constitution' do
    specify { expect(subject.constitution).to eql 2 }
  end

  describe '#strength' do
    specify { expect(subject.strength).to eql -2 }
  end
end
