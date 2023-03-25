# frozen_string_literal: true

class Admin_User < ApplicationRecord
  belongs_to :admin
  belongs_to :user
end
