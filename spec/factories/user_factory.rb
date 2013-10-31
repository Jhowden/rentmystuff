FactoryGirl.define do

	factory :user do
		ignore do
			auth OmniAuth.config.mock_auth[:facebook]
		end

		email
		initialize_with { from_facebook(auth) }
	end
end