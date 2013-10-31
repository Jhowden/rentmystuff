require 'spec_helper'


describe User do
  subject(:user) { User.from_facebook(OmniAuth.config.mock_auth[:facebook]) }


  describe ".from_facebook" do
    
    its(:class) {should eq User}

    its(:first_name) { should eq "Mark" }

  end

  it 'validates first and last name' do
    expect {User.from_facebook(OmniAuth.config.mock_auth[:facebook_no_name]) }
    .to raise_error
  end

  it 'validates email' do
    expect {User.from_facebook(OmniAuth.config.mock_auth[:facebook_no_email]) }
    .to raise_error
  end

  describe "association with lended item" do

    it_should_behave_like 'it has many', :lended_items, FactoryGirl.create(:item)
  end

  describe 'association with borrowed items' do
    it_should_behave_like 'it has many', :borrowed_items, FactoryGirl.create(:item)

  end

  describe 'association with given_feebacks' do
    it_should_behave_like 'it has many', :given_feedbacks, FactoryGirl.create(:feedback)
  end

  describe 'association with received_feedbacks' do
    let(:item) {create(:item)}
  let(:feedback) { create(:feedback) }
    before do
      user.lended_items << item
      item.received_feedbacks << feedback
    end
    
    subject {user.received_feedbacks }


    it { should be_a Array }

    it { should include feedback }

  end
 
end



