class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # create many to many relationship with roles table by using user_roles table
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  has_many :admin_users, dependent: :nullify
  has_many :admins, through: :admin_users

  def has_role?(role)
    roles.exists?(name: role)
  end

end
