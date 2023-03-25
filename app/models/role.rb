class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  has_many :admin_roles, dependent: :nullify
  has_many :admins, through: :admin_roles
end
