RSpec.describe PathfinderRpg::Character do
  it { expect(PathfinderRpg::Character).to include PathfinderRpg::Character::AbilityScores }
  it { expect(PathfinderRpg::Character).to include PathfinderRpg::Character::Klass::Include }
end
