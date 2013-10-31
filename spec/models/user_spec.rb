require 'spec_helper'

describe User do
  let(:user) { User.from_facebook(OmniAuth.config.mock_auth[:facebook]) }
  let(:item) {Item.create(title: "Camera", 
                     description: "This camera is awesome", 
                     available: true, 
                     start_time: "10/30/2013", 
                     end_time: "11/30/2013", 
                     lender_id: nil,
                     price: 30)}
  let(:feedback) { Feedback.create(thumbs_up: true, comment: "AWESOME") }


  describe ".from_facebook" do
    
    it 'return a user object' do
      user.class.should eq User
    end

    it 'pulls name from facebook' do
      user.first_name.should eq "Mark"
    end

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
    before do
      user.lended_items << item
    end

    it 'returns an array' do
      user.lended_items.should be_a Array
    end

    it 'contains the lended item' do
      user.lended_items.should include item
    end
  end

  describe 'association with borrowed items' do
    before do
      user.borrowed_items << item
    end 

    it 'returns an array' do
      user.borrowed_items.should be_a Array
    end    

    it 'contains the borrowed item' do
      user.borrowed_items.should include item
    end
  end

  describe 'association with given_feebacks' do
    before do
      user.given_feedbacks << feedback
    end
    it 'returns an Array' do
      user.given_feedbacks.should be_a Array
    end

    it 'contains the given feedback' do
      user.given_feedbacks.should include feedback
    end
  end

  describe 'association with received_feedbacks' do
    before do
      user.lended_items << item
      item.received_feedbacks << feedback
    end

    it 'returns an Array' do
      user.received_feedbacks.should be_a Array
    end

    it 'contains the right feedback' do
      user.received_feedbacks.should include feedback
    end
  end
 
end



