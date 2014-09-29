shared_examples 'PathfinderRpg::Character::Klass::Base' do
  let(:character) { PathfinderRpg::Character.new }

  describe '#character' do
    subject { described_class.new(character) }

    it { expect(subject.character).to eql character }
  end

  describe '#level' do
    context "instantiating without 'level' argument" do
      subject { described_class.new(character) }

      it { expect(subject.level).to eql 1 }
    end

    context "instantiating with 'level' argument" do
      subject { described_class.new(character, 7) }

      it { expect(subject.level).to eql 7 }
    end
  end

  describe '#favored' do
    context "instantiating without 'favored' argument" do
      subject { described_class.new(character, 8) }

      it { expect(subject.favored).to be false }
    end

    context "instantiating without 'favored' argument" do
      subject { described_class.new(character, 7, true) }

      it { expect(subject.favored).to be true }
    end
  end
end
