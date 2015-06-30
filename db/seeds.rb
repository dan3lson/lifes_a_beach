puts "==============================================="
puts "Creating Users"
puts "==============================================="

user = User.create!(
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password"
)
puts "User Email: #{user.email}"
