require 'spec_helper'

describe Item do
  let(:item) {Item.new(title: "Camera", 
                     description: "This camera is awesome", 
                     available: true, 
                     start_time: "10/30/2013", 
                     end_time: "11/30/2013", 
                     lender_id: nil,
                     price: 30)}
  it "item should be available by default" do
    item.available.should be_true
  end

  it "requires a title" do
    Item.create.should_not be_valid
  end
end
