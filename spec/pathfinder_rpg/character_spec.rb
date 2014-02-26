require 'spec_helper'

describe PathfinderRpg::Character do
  specify { PathfinderRpg::Character.should include PathfinderRpg::Character::AbilityScores }
end
