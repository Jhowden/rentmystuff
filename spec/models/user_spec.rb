require 'spec_helper'

describe User do
  let(:user) { User.from_facebook(OmniAuth.config.mock_auth[:facebook]) }

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

end



