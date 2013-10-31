require 'spec_helper'

describe Feedback do
  let(:user) { User.from_facebook(OmniAuth.config.mock_auth[:facebook]) }
  let(:feedback) { Feedback.create(thumbs_up: true, comment: "AWESOME") }

  it 'validates presence of thumbs up' do
    Feedback.new.should_not be_valid
  end

  it 'validates presence of comment' do
    Feedback.new(:thumbs_up => false).should_not be_valid
  end

  describe 'association with giver' do
    before do
      feedback.giver = user
    end

    it 'is an instance of User' do
      feedback.giver.should be_a User
    end

    it 'is the correct user' do
      feedback.giver.should eq user
    end
  end
end
