describe PathfinderRpg::Character::Klass::Monk do
  it_behaves_like 'PathfinderRpg::Character::Klass::Base'

  let(:character) { PathfinderRpg::Character.new }
  let(:level) { 5 }

  subject { described_class.new(character, level) }

  describe '.label' do
    it { expect(described_class.label).to eql 'monk' }
  end

  describe '#label' do
    it { expect(subject.label).to eql 'monk' }
  end

  describe '.available_alignments' do
    it { expect(described_class.available_alignments).to include('lawful_good', 'lawful_neutral', 'lawful_evil') }
    it { expect(described_class.available_alignments).not_to include('neutral_good', 'chaotic_good', 'true_neutral', 'chaotic_neutral', 'neutral_evil', 'chaotic_evil') }
  end

  describe '#available_alignments' do
    it { expect(subject.available_alignments).to include('lawful_good', 'lawful_neutral', 'lawful_evil') }
    it { expect(subject.available_alignments).not_to include('neutral_good', 'chaotic_good', 'true_neutral', 'chaotic_neutral', 'neutral_evil', 'chaotic_evil') }
  end

  describe '.skill_ranks_per_level' do
    it { expect(described_class.skill_ranks_per_level).to eql 4 }
  end

  describe '#skill_ranks_per_level' do
    it { expect(subject.skill_ranks_per_level).to eql 4 }
  end

  describe '#skills_per_level' do
    before { character.intelligence = intelligence }

    context 'with an intelligence of 10' do
      let(:intelligence) { 10 }

      it { expect(subject.skills_per_level).to eql 4 }
    end

    context 'with an intelligence of 15' do
      let(:intelligence) { 15 }

      it { expect(subject.skills_per_level).to eql 6 }
    end

    context 'with an intelligence of 27' do
      let(:intelligence) { 27 }

      it { expect(subject.skills_per_level).to eql 12 }
    end
  end

  describe '.hit_die' do
    it { expect(described_class.hit_die).to eql 8 }
  end

  describe '#hit_die' do
    it { expect(subject.hit_die).to eql 8 }
  end

  describe '#base_attack_bonus' do
    it { expect { subject.base_attack_bonus(0) }.to raise_error(ArgumentError) }

    context 'at level 1' do
      let(:level) { 1 }

      it { expect(subject.base_attack_bonus).to eql 0 }
      it { expect(subject.base_attack_bonus(1)).to eql 0 }
    end

    context 'at level 5' do
      let(:level) { 5 }

      it { expect(subject.base_attack_bonus).to eql 3 }
      it { expect(subject.base_attack_bonus(1)).to eql 3 }
      it { expect(subject.base_attack_bonus(2)).to eql 0 }
    end

    context 'at level 10' do
      let(:level) { 10 }

      it { expect(subject.base_attack_bonus).to eql 7 }
      it { expect(subject.base_attack_bonus(1)).to eql 7 }
      it { expect(subject.base_attack_bonus(2)).to eql 2 }
      it { expect(subject.base_attack_bonus(3)).to eql 0 }
    end

    context 'at level 15' do
      let(:level) { 15 }

      it { expect(subject.base_attack_bonus).to eql 11 }
      it { expect(subject.base_attack_bonus(1)).to eql 11 }
      it { expect(subject.base_attack_bonus(2)).to eql 6 }
      it { expect(subject.base_attack_bonus(3)).to eql 1 }
      it { expect(subject.base_attack_bonus(4)).to eql 0 }
    end

    context 'at level 20' do
      let(:level) { 20 }

      it { expect(subject.base_attack_bonus).to eql 15 }
      it { expect(subject.base_attack_bonus(1)).to eql 15 }
      it { expect(subject.base_attack_bonus(2)).to eql 10 }
      it { expect(subject.base_attack_bonus(3)).to eql 5 }
      it { expect(subject.base_attack_bonus(4)).to eql 0 }
    end
  end

  describe '#available_attacks' do
    context 'at level 1' do
      let(:level) { 1 }

      it { expect(subject.available_attacks).to eql 1 }
    end

    context 'at level 5' do
      let(:level) { 5 }

      it { expect(subject.available_attacks).to eql 1 }
    end

    context 'at level 10' do
      let(:level) { 10 }

      it { expect(subject.available_attacks).to eql 2 }
    end

    context 'at level 15' do
      let(:level) { 15 }

      it { expect(subject.available_attacks).to eql 3 }
    end

    context 'at level 20' do
      let(:level) { 20 }

      it { expect(subject.available_attacks).to eql 3 }
    end
  end

  describe '#fortitude_save_base' do
    context 'at level 1' do
      let(:level) { 1 }

      it { expect(subject.fortitude_save_base).to eql 2 }
    end

    context 'at level 5' do
      let(:level) { 5 }

      it { expect(subject.fortitude_save_base).to eql 4 }
    end

    context 'at level 10' do
      let(:level) { 10 }

      it { expect(subject.fortitude_save_base).to eql 7 }
    end

    context 'at level 15' do
      let(:level) { 15 }

      it { expect(subject.fortitude_save_base).to eql 9 }
    end

    context 'at level 20' do
      let(:level) { 20 }

      it { expect(subject.fortitude_save_base).to eql 12 }
    end
  end

  describe '#reflex_save_base' do
    context 'at level 1' do
      let(:level) { 1 }

      it { expect(subject.reflex_save_base).to eql 2 }
    end

    context 'at level 5' do
      let(:level) { 5 }

      it { expect(subject.reflex_save_base).to eql 4 }
    end

    context 'at level 10' do
      let(:level) { 10 }

      it { expect(subject.reflex_save_base).to eql 7 }
    end

    context 'at level 15' do
      let(:level) { 15 }

      it { expect(subject.reflex_save_base).to eql 9 }
    end

    context 'at level 20' do
      let(:level) { 20 }

      it { expect(subject.reflex_save_base).to eql 12 }
    end
  end

  describe '#will_save_base' do
    context 'at level 1' do
      let(:level) { 1 }

      it { expect(subject.will_save_base).to eql 2 }
    end

    context 'at level 5' do
      let(:level) { 5 }

      it { expect(subject.will_save_base).to eql 4 }
    end

    context 'at level 10' do
      let(:level) { 10 }

      it { expect(subject.will_save_base).to eql 7 }
    end

    context 'at level 15' do
      let(:level) { 15 }

      it { expect(subject.will_save_base).to eql 9 }
    end

    context 'at level 20' do
      let(:level) { 20 }

      it { expect(subject.will_save_base).to eql 12 }
    end
  end
end
