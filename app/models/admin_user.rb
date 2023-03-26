# frozen_string_literal: true

# == Schema Information
#
# Table name: admin_users
#
#  id         :bigint           not null, primary key
#  admin_id   :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
