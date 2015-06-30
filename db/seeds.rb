Rails.logger.info "==============================================="
Rails.logger.info "Creating Users"
Rails.logger.info "==============================================="

user = User.create!(
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password"
)
Rails.logger.info "User Email: #{user.email}"
