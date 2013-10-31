require 'spec_helper'


describe User do
  subject(:user) { User.from_facebook(OmniAuth.config.mock_auth[:facebook]) }
  let(:user_2) { User.from_facebook(OmniAuth.config.mock_auth[:facebook_2]) }

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

  describe 'association with borrowings' do
    let(:item) {create(:item)}

    before do
      subject.lended_items << item
    end

    its(:pending_requests) { should be_a Array }
    its(:pending_requests) { should be_empty }

    it 'is initialized with someone borrowing the item' do
      user_2.borrowed_items << item
      subject.pending_requests.should_not be_empty
    end

  describe '.name' do
    it 'validates the name of the person receiving the email' do
      user.display_name.should eq "Mark Jankowski"
    end
  end

  describe '.notifications_email' do
    it 'sends an email to the user while taking an argument' do
      user.notifications_email("Why hello there").should eq "ghost@nobody.com"
    end
  end
 
end



