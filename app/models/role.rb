# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord

  has_many :user_roles, dependent: :nullify
  has_many :users, through: :user_roles

  has_many :admin_roles, dependent: :nullify
  has_many :admins, through: :admin_roles

  # set enum for roles
  enum name: { user: 'user', admin: 'admin', super_admin: 'super_admin', coach: 'coach' }
  # create roles with enum name
  Role.names.each_key do |role|
    Role.find_or_create_by(name: role)
  end
  # TODO: restrict roles:user in Role for admin created users.
  # TODO: add admin users for users where admin is true.
  # TODO: add default role to user for all users except defined roles.
  # todo: use cancancan ability to define user roles.
end
