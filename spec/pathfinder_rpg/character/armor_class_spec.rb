describe PathfinderRpg::Character::ArmorClass do
  subject { PathfinderRpg::Character::ArmorClass.new(character) }

  let(:character) { PathfinderRpg::Character.new }

  pending '#armor_bonus'
  pending '#shield_bonus'
  pending '#natural_bonus'

  describe '#size_bonus' do
    context 'with a small race' do
      before { character.set_race(:halfling) }

      specify { expect(subject.size_bonus).to eql 1 }
    end

    context 'with a medium race' do
      before { character.set_race(:human) }

      specify { expect(subject.size_bonus).to eql 0 }
    end
  end

  pending '#deflection_bonus'
  pending '#dodge_bonus'

  pending 'touch'
  pending 'flat_footed'
  pending 'total'
end
