class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  has_many :admin_roles
  has_many :admins, through: :admin_roles
end
