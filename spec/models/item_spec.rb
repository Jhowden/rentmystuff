require 'spec_helper'

describe Item do
  let(:item) {Item.create(title: "Camera", 
                     description: "This camera is awesome", 
                     available: true, 
                     start_time: "10/30/2013", 
                     end_time: "11/30/2013", 
                     lender_id: nil,
                     price: 30)}
  let(:user) { User.from_facebook(OmniAuth.config.mock_auth[:facebook]) }
  
  it "item should be available by default" do
    item.available.should be_true
  end

  it "requires a title" do
    Item.create.should_not be_valid
  end

  describe 'association with lender' do
    before do
      item.lender = user
    end

    it 'returns a user' do
      item.lender.should be_a User
    end

    it 'returns the associated user' do
      item.lender.should eq user
    end
  
  end

  describe 'association with borrowers' do
    before do
      item.borrowers << user
  end

    it 'returns an Array' do
      item.borrowers.should be_a Array
    end

    it 'includes the associated user' do
      item.borrowers.should include user
    end
  end
end
