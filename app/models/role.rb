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

  # TODO: add default role to user for all users except defined roles.
  # todo: use cancancan ability to define user roles.
end
