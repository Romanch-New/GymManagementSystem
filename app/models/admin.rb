# Admin model
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user, dependent: :destroy
  # scope for users who have admin = true with all the admin from admin table
  scope :admins, -> { joins(:user).where(users: { admin: true }) }

  scope :users, -> { joins(:user).where(users: { admin: false }) }

end
