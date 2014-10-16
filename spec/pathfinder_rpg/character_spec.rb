describe PathfinderRpg::Character do
  specify { PathfinderRpg::Character.should include PathfinderRpg::Character::AbilityScores }
  specify { PathfinderRpg::Character.should include PathfinderRpg::Character::Klass::Include }
end
