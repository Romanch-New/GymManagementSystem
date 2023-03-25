# frozen_string_literal: true
# create class for table user_roles
# class UserRole < ApplicationRecord
#  belongs_to :user
# belongs_to :role
# end
class UserRole < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :role, dependent: :destroy

  validates_uniqueness_of :user_id, scope: :role_id
end
