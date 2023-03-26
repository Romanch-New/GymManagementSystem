# frozen_string_literal: true

# == Schema Information
#
# Table name: admins
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#
# Admin model
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :name, length: { minimum: 2, maximum: 20 }

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true
  validates :password, length: { minimum: 8 }
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/,
                                 message: 'must contain at least one lowercase letter,
                                            one uppercase letter, and one digit' }

  validates :password_confirmation, presence: true


  has_many :admin_roles, dependent: :destroy
  has_many :roles, through: :admin_roles

  has_many :admin_users, dependent: :destroy
  has_many :users, through: :admin_users
end
