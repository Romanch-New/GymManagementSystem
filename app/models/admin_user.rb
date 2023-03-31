# frozen_string_literal: true

# == Schema Information
#
# Table name: admin_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_admin_users_on_admin_id              (admin_id)
#  index_admin_users_on_admin_id_and_user_id  (admin_id,user_id) UNIQUE
#  index_admin_users_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (admin_id => admins.id)
#  fk_rails_...  (user_id => users.id)
#
class AdminUser < ApplicationRecord
  belongs_to :admin, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates_uniqueness_of :admin_id, scope: :user_id
end
