# Admin model
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :admin_roles, dependent: :destroy
  has_many :roles, through: :admin_roles

  has_many :admin_users, dependent: :destroy
  has_many :users, through: :admin_users

  # TODO: add validation for email and password.
  # TODO: remove user role for admin table role.
  # TODO: add admin users for users where admin is true.

end
