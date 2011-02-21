# == Schema Information
#
# Table name: posts
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  body       :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#
class Post < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => { :big => "600x600>", \
      :medium => "300x300>", :thumb => "100x100>" }

  default_scope :order => 'id DESC'

  acts_as_taggable
end
