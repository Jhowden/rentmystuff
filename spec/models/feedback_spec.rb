require 'spec_helper'

describe Feedback do
  let(:user) { User.from_facebook(OmniAuth.config.mock_auth[:facebook]) }
  subject(:feedback) { create(:feedback) }

  it 'validates presence of thumbs up' do
    Feedback.new(comment: "cool").should_not be_valid
  end

  it 'validates presence of comment' do
    Feedback.new(:thumbs_up => false).should_not be_valid
  end

  describe 'association with giver' do
    before { feedback.giver = user }

    its(:giver) { should be_a User }

    its(:giver) {should eq user}
  end
end
