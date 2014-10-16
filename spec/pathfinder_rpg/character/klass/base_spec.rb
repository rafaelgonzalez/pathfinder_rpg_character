describe PathfinderRpg::Character::Klass::Base do
  let(:character) { PathfinderRpg::Character.new }

  subject { described_class.new(character) }

  describe '.available_alignments' do
    it { expect { described_class.available_alignments }.to raise_error(NotImplementedError) }
  end

  describe '#available_alignments' do
    it { expect { subject.available_alignments }.to raise_error(NotImplementedError) }
  end

  describe '.skill_ranks_per_level' do
    it { expect { described_class.skill_ranks_per_level }.to raise_error(NotImplementedError) }
  end

  describe '#skill_ranks_per_level' do
    it { expect { subject.skill_ranks_per_level }.to raise_error(NotImplementedError) }
  end

  describe '.hit_die' do
    it { expect { described_class.hit_die }.to raise_error(NotImplementedError) }
  end

  describe '#hit_die' do
    it { expect { subject.hit_die }.to raise_error(NotImplementedError) }
  end
end
