# frozen_string_literal: true

class Admin_Role < ApplicationRecord
  belongs_to :admin
  belongs_to :role
end
