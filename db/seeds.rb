# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


user = User.create!(
  uid: '0',
  username: 'admin',
  email: 'admin@admin.com',
  first_name: 'Admin',
  last_name: 'User',
  birthday: Date.today,
  country: 'Earth',
  password: 'adminpassword',
  password_confirmation: 'adminpassword',
  admin_status: true
)

User.create!(
  uid: '1',
  username: 'deleteme',
  email: 'deleteme@example.com',
  first_name: 'Delete',
  last_name: 'Me',
  birthday: Date.today,
  country: 'Earth',
  password: 'deletemepassword',
  password_confirmation: 'deletemepassword',
  admin_status: false
)

User.create!(
  uid: '2',
  username: 'updateme',
  email: 'updateme@example.com',
  first_name: 'Update',
  last_name: 'Me',
  birthday: Date.today,
  country: 'Earth',
  password: 'updatemepassword',
  password_confirmation: 'updatemepassword',
  admin_status: false
)
