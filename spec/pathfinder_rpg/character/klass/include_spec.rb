describe PathfinderRpg::Character::Klass::Include do
  subject { PathfinderRpg::Character.new }

  describe '#level' do
    context 'with no klass' do
      it { expect(subject.level).to eql 0 }
    end

    context 'with one klass' do
      before { subject.add_klass(:bard, 9) }

      it { expect(subject.level).to eql 9 }
    end

    context 'with multiple klasses' do
      before do
        subject.add_klass(:monk, 4)
        subject.add_klass(:sorcerer, 3)
        subject.add_klass(:barbarian, 8)
      end

      it { expect(subject.level).to eql 15 }
    end
  end

  describe '#attacks_per_round' do
    context 'with no klass' do
      it { expect(subject.attacks_per_round).to eql 0 }
    end

    context 'with one klass' do
      before { subject.add_klass(:bard, 9) }

      it { expect(subject.attacks_per_round).to eql 2 }
    end

    context 'with multiple klasses' do
      before do
        subject.add_klass(:monk, 17)
        subject.add_klass(:sorcerer, 12)
        subject.add_klass(:barbarian, 2)
      end

      it { expect(subject.attacks_per_round).to eql 3 }
    end
  end

  describe '#add_klass' do
    context 'with a valid klass name' do
      it 'adds the klass' do
        expect(subject.klasses).to be_empty

        subject.add_klass(:paladin)

        expect(subject.klasses.size).to eql 1
        expect(subject.klasses.first).to be_a PathfinderRpg::Character::Klass::Paladin
      end
    end

    context 'with an invalid klass name' do
      it { expect { subject.add_klass(:bleh) }.to raise_error(ArgumentError) }
    end

    context 'with a klass already added' do
      before { subject.add_klass(:fighter) }

      it { expect { subject.add_klass(:fighter) }.to raise_error(ArgumentError) }
    end
  end
end
