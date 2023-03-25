# frozen_string_literal: true

class User_Role < ApplicationRecord
  belongs_to :user
  belongs_to :role
end
