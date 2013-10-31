require 'spec_helper'

describe Item do
  subject(:item) { build :item }
  let(:user) { User.from_facebook(OmniAuth.config.mock_auth[:facebook]) }
  let(:feedback) { build :feedback }
  
  
  its(:available){ should be_true }

  it "requires a title" do
   Item.new.should_not be_valid
 end

  describe 'association with lender' do
    before { item.lender = user }

    its(:lender) { should eq user }
  end

  describe 'association with borrowers' do
    it_should_behave_like 'it has many', :borrowers, User.from_facebook(OmniAuth.config.mock_auth[:facebook])

  end

  describe 'association with feedback' do
    it_should_behave_like 'it has many', :received_feedbacks, FactoryGirl.create(:feedback)
  end
end
