# == Schema Information
#
# Table name: posts
#
#  id      :integer          not null, primary key
#  title   :string           not null
#  content :string           not null
#  user_id :integer          not null
#

class Post < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
end
