class Role < ApplicationRecord
  has_many :user_roles, dependent: :nullify
  has_many :users, through: :user_roles

  has_many :admin_roles, dependent: :nullify
  has_many :admins, through: :admin_roles

  # TODO: add more roles for users and admins.
end
