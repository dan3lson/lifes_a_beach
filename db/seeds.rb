Rails.logger.info "==============================================="
Rails.logger.info "Creating Users"
Rails.logger.info "==============================================="

user = User.create!(
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password"
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
