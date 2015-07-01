Rails.logger.info "==============================================="
Rails.logger.info "Creating Users"
Rails.logger.info "==============================================="

user = User.create!(
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password"
)

beach = Beach.find_or_create_by!(
  street1: "123 Beach Drive",
  street2: "Apt. 5",
  city: "Boston",
  state: "MA",
  zip: "01234",
  entrance_fee: 1.00,
  picture_url: "http://www.wow.com",
  description: "This is the best beach.",
  name: "Tom Ford Beach",
  user_id: user.id
)

Review.find_or_create_by!(
  rating: 5,
  description: "cool spot",
  beach_id: beach.id,
  user_id: user.id,
  score: 0
)

Rails.logger.info "User Email: #{user.email}"

Rails.logger.info "==============================================="
Rails.logger.info "Creating Amenities"
Rails.logger.info "==============================================="

amenities = [
  Amenity.create!(name: "Dogs Allowed"),
  Amenity.create!(name: "Volleyball Courts"),
  Amenity.create!(name: "Showers"),
  Amenity.create!(name: "Grills"),
  Amenity.create!(name: "Permit Required"),
  Amenity.create!(name: "Fishing"),
  Amenity.create!(name: "Boardwalk"),
  Amenity.create!(name: "Parking"),
  Amenity.create!(name: "Food Vvendors"),
  Amenity.create!(name: "Bathrooms")
]
amenities.each { |amenity| Rails.logger.info "Amentity: #{amenity.name}" }
