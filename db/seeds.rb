# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seeds: development users activated
# Fixtures: test users activated

# user = User.find_by(email: "prvn262@gmail.com")
# user.update(admin: true)


# Create a main sample user.
# ! uses for show/flash validation fail errors: if we dont use it rails silently skip user .:
User.find_or_create_by!(email: "admin@example.com") do |user|
  user.name = "Admin User"
  user.password = "password"
  user.password_confirmation = "password"
  user.admin = true
  user.activated = true
  activated_at = Time.zone.now
end

User.find_or_create_by!(email: "example@railstutorial.org") do |user|
  user.name = "example User"
  user.password = "password"
  user.password_confirmation = "password"
  user.admin = false
  user.activated = true
  activated_at = Time.zone.now
end

# Generate a bunch of additional users.
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password,
              admin: false, activated: true, activated_at: Time.zone.now)
end




# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end













