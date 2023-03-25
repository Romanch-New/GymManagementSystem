# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Create 10 users with random names and emails
admin = [true, false]

10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    admin: admin.sample(rand(1..2))
  )
end

# Create 2 admins with specific email and password
Admin.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Admin User'
)

Admin.create!(
  email: 'superadmin@example.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Super Admin User'
)

# create admin users
admin_user_1 = Admin.create(email: 'admin1@example.com', password: 'password', name: 'Admin User 1')
admin_user_2 = Admin.create(email: 'admin2@example.com', password: 'password', name: 'Admin User 2')

# create regular users
user_1 = User.create(email: 'user1@example.com', password: 'password', name: 'User 1', admin: true)
user_2 = User.create(email: 'user2@example.com', password: 'password', name: 'User 2', admin: false)

# associate admin users with roles
admin_role = Role.create(name: 'admin')
admin_user_1.roles << admin_role
admin_user_2.roles << admin_role

# associate regular users with roles
user_role = Role.create(name: 'user')
user_1.roles << admin_role
user_2.roles << user_role

# Assign roles to users
user_ids = User.pluck(:id)
role_ids = Role.pluck(:id)

user_ids.each do |user_id|
  role_ids.sample(rand(1..2)).each do |role_id|
    User_Role.create!(
      user_id: user_id,
      roles_id: role_id
    )
  end
end

# Assign roles to admins
admin_ids = Admin.pluck(:id)

admin_ids.each do |admin_id|
  role_ids.sample(rand(1..2)).each do |role_id|
    Admin_Role.create!(
      admin_id: admin_id,
      roles_id: role_id
    )
  end
end



