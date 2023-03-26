# frozen_string_literal: true

# == Schema Information
#
# Table name: user_roles
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  role_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
