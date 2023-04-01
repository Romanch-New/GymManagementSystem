# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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

  validates :name, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :name, length: { minimum: 2, maximum: 20 }

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'only allows valid email' }

  validates :password, presence: true
  validates :password, length: { minimum: 8 }
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/,
                                 message: 'must contain at least one lowercase letter,
                                           one uppercase letter, and one digit' }

  validates :admin, inclusion: { in: [true, false] }

  attribute :admin, :boolean, default: false

  before_validation :set_admin_attribute, if: :admin

  private

  def set_admin_attribute
    self.admin = true
  end

end
