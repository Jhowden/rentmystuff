# SEEDS 1.0 - BETA

require 'faker'

# User
10.times do
User.create(
            # provider: string,
            # uid: string,
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: Faker::Internet.email,
            image_url: "rails.png"
            # facebook_url: Faker::Internet.url,
            # oauth_token: string,
            # oauth_exphotores_at: datetime,
           )
end

# * * * * * * * * * * * * * * *

# Item
20.times do

day_generator = (4..20).to_a.sample
day_increment = day_generator + (1..3).to_a.sample
Item.create(
            title: Faker::Commerce.product_name,
            description: Faker::Lorem.paragraph,
            price: [5,10,15,20].sample,
            available: [true, false].sample,
            start_time:  Date.new(2013,11,day_generator),
            end_time: Date.new(2013,11,day_increment),
            # lender_id: (1..50).to_a.sample
           )
end

# * * * * * * * * * * * * * * *

# # Photo
# 20.times do |i|

# photo = Photo.create!(:product => product)
# photo.image.store!(File.open(File.join(Rails.root, 'rails.png')))
# product.product_images << photo
# product.save!

# Photo.create(

#               file: File.open("../app/assets/images/rails.png"),
#               item_id: i+1
#               )
# end

# * * * * * * * * * * * * * * *

# Feedback

10.times do |i|
  Feedback.create(
    giver_id: 1+i,
    comment: "This is some really good feedback",
    thumbs_up: [true,false].sample
  )
end

# * * * * * * * * * * * * * * *

two_items_counter = 1
10.times do |i|

    User.find(i+1).lended_items << Item.find(two_items_counter)
    two_items_counter+=1
    User.find(i+1).borrowed_items << Item.find(two_items_counter)
    two_items_counter+=1

end




10.times do |i|
item = Item.find(i+1)
item.received_feedbacks << Feedback.find(i+1)

end



