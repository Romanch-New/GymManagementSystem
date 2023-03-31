# frozen_string_literal: true

# == Schema Information
#
# Table name: admin_roles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :bigint           not null
#  role_id    :bigint           not null
#
# Indexes
#
#  index_admin_roles_on_admin_id              (admin_id)
#  index_admin_roles_on_admin_id_and_role_id  (admin_id,role_id) UNIQUE
#  index_admin_roles_on_role_id               (role_id)
#
# Foreign Keys
#
#  fk_rails_...  (admin_id => admins.id)
#  fk_rails_...  (role_id => roles.id)
#
class AdminRole < ApplicationRecord
  belongs_to :admin
  belongs_to :role

  validates_uniqueness_of :admin_id, scope: :role_id
end
