# frozen_string_literal: true
# create class for table admin_users
# class AdminUser < ApplicationRecord
#  belongs_to :admin
# belongs_to :user
# end
class AdminUser < ApplicationRecord
  belongs_to :admin, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates_uniqueness_of :admin_id, scope: :user_id
end
