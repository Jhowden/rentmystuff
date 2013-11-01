FactoryGirl.define do

	factory :user do
		ignore do
			auth OmniAuth.config.mock_auth[:facebook]
		end

		email
		initialize_with { from_facebook(auth) }
	end

  factory :user_2 do
    ignore do
      auth OmniAuth.config.mock_auth[:facebook_2]
    end

    email
    initialize_with { from_facebook(auth) }
  end
end
