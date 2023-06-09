# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# binding.pry
#delete all table before create new data

AdminRole.delete_all
AdminUser.delete_all
UserRole.delete_all
Role.delete_all
User.delete_all
Admin.delete_all

require 'faker'

# Create 10 users with random names and emails


10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    admin: [true, false].sample
  )
end
# Create 2 admins with specific email and password
Admin.create!(
  email: 'admins@example.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'admins User'
)

Admin.create!(
  email: 'superadmin@example.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Super admins User'
)

# create admins users
admin_user_1 = Admin.create(email: 'admin1@example.com', password: 'password', name: 'admins User 1')
admin_user_2 = Admin.create(email: 'admin2@example.com', password: 'password', name: 'admins User 2')
# test created admins users
puts "Created admins users: #{admin_user_1.name} (#{admin_user_1.email}), #{admin_user_2.name} (#{admin_user_2.email})"

# create regular users
user_1 = User.create(email: 'user1@example.com', password: 'password', name: 'User 1', admin: true)
user_2 = User.create(email: 'user2@example.com', password: 'password', name: 'User 2', admin: false)
# test created regular users
puts "Created regular users: #{user_1.name} (#{user_1.email}), #{user_2.name} (#{user_2.email})"
# test if regular users are admins
puts "User 1 is admins: #{user_1.admin}"
puts "User 2 is admins: #{user_2.admin}"

# Create 3 roles
Role.create(name: 'guest')

# associate admins users with roles
admin_role = Role.create(name: 'admins')

admin_user_1.roles << admin_role
admin_user_2.roles << admin_role

# test created roles and admins users roles
puts "Created roles: #{admin_role.name}"
puts "admins User 1 roles: #{admin_user_1.roles.pluck(:name)}"
puts "admins User 2 roles: #{admin_user_2.roles.pluck(:name)}"

# associate regular users with roles
user_role = Role.create(name: 'users')
# use pry to test

user_1.roles << user_role
user_2.roles << user_role

# Assign roles to users
user_ids = User.pluck(:id)
role_ids = Role.pluck(:id)

user_ids.each do |user_id|
  role_ids.sample(rand(1..2)).each do |role_id|
    UserRole.create!(
      user_id: user_id,
      role_id: role_id
    )
  end
end

# Assign roles to admins
admin_ids = Admin.pluck(:id)

admin_ids.each do |admin_id|
  role_ids.sample(rand(1..2)).each do |role_id|
    AdminRole.create!(
      admin_id: admin_id,
      role_id: role_id
    )
  end
end



