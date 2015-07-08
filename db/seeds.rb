Rails.logger.info "==============================================="
Rails.logger.info "Creating Users"
Rails.logger.info "==============================================="

6.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
  Rails.logger.info "User Email: #{user.email}"
end
User.create!(
  email: "danelson@rosa.com",
  password: "danelson",
  password_confirmation: "danelson"
)

Rails.logger.info "==============================================="
Rails.logger.info "Creating Amenities"
Rails.logger.info "==============================================="

@amenities = [
  Amenity.create!(name: "Dogs Allowed"),
  Amenity.create!(name: "Volleyball Courts"),
  Amenity.create!(name: "Showers"),
  Amenity.create!(name: "Grills"),
  Amenity.create!(name: "Permit Required"),
  Amenity.create!(name: "Fishing"),
  Amenity.create!(name: "Boardwalk"),
  Amenity.create!(name: "Parking"),
  Amenity.create!(name: "Food Vendors"),
  Amenity.create!(name: "Bathrooms")
]
@amenities.each { |amenity| Rails.logger.info "Amentity: #{amenity.name}" }

Rails.logger.info "==============================================="
Rails.logger.info "Creating Beaches"
Rails.logger.info "==============================================="

30.times do
  beach = Beach.create!(
    name: Faker::Company.name,
    street1: Faker::Address.street_name,
    street2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip_code,
    user: User.all.sample,
    entrance_fee: 6.50,
    description: Faker::Lorem.sentence,
    picture_url: File.open(File.join(Rails.root, "spec/support/images/default_beach.jpg"))
  )
  beach.amenities << @amenities.sample
  Rails.logger.info "Beach name: #{beach.name}"
end

Rails.logger.info "==============================================="
Rails.logger.info "Creating Reviews"
Rails.logger.info "==============================================="

1.times do
  Review.create!(
    rating: rand(1..5),
    user: User.first,
    beach: Beach.first,
    description: Faker::Lorem.sentence,
  )
end
