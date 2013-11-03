require 'faker'

photo_urls = ['camera.jpg', 'camera1.jpg', 'bike.jpg', 'guitar.jpg', 'volkswagen.jpg']


50.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    image_url: 'rails.png'
    )
end


dates = (Date.new(2013, 11, 2)...Date.new(2013,12,3)).to_a


User.all.each do |user|
  rand(1..10).times do

    user.lended_items.create(
      title: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      price: [5,10,15,20].sample,
      available: [true, false].sample
      )
  end

  rand(1..20).times do
    item = Item.all.sample
    user.borrowed_items << item unless user.borrowed_items.include?(item)
  end

end

Item.all.each do |item|

  rand(4..10).times do 

    feedback = Feedback.create(
      comment: Faker::Lorem.sentences(3),
      thumbs_up: [true,false].sample,
      giver_id: User.all.sample.id
      )

    item.received_feedbacks << feedback
  end

  rand(1..20).times do
    date = RentalDate.create(date: dates.sample)
    item.dates << date unless item.dates.include?(date)
  end

  rand(3..5).times do
    photo = Photo.create!
    photo.file.store!(File.open(File.join(Rails.root, photo_urls.sample)))
    item.photos << photo
  end
end

Borrowing.all.each do |b|
  rand(1..10).times do
    date = RentalDate.create(date: dates.sample)
    b.dates << date unless b.dates.include?(date)
  end
end












