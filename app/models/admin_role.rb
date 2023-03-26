# frozen_string_literal: true

# == Schema Information
#
# Table name: admin_roles
#
#  id         :bigint           not null, primary key
#  admin_id   :bigint           not null
#  role_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
