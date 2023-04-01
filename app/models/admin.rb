# frozen_string_literal: true

# == Schema Information
#
# Table name: admins
#
#  id                     :bigint           not null, primary key
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
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :email, presence: true

  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :name, length: { minimum: 2, maximum: 20 }

  validates :email, uniqueness: true

  validates :password, length: { minimum: 8 }
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/,
                                 message: 'must contain at least one lowercase letter,
                                            one uppercase letter, and one digit' }


  has_many :admin_roles, dependent: :destroy
  has_many :roles, through: :admin_roles

  has_many :admin_users, dependent: :destroy
  has_many :users, through: :admin_users
end
