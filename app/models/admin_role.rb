# frozen_string_literal: true
#create class for table admin_roles
# class AdminRole < ApplicationRecord
#  belongs_to :admin
# belongs_to :role
# end
class AdminRole < ApplicationRecord
  belongs_to :admin
  belongs_to :role

  validates_uniqueness_of :admin_id, scope: :role_id
end
