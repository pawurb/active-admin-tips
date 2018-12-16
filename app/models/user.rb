# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  email      :string           not null
#  is_admin   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  include NormalizeBlankValues
  NORMALIZABLE_ATTRIBUTES = %i(email)

  validates :first_name, :last_name, presence: true
  has_many :posts
end
