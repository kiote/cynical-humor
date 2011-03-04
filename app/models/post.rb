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
  validates_presence_of :title, :title_url

  cattr_reader :per_page
  @@per_page = 10

  has_attached_file :image, :styles => { :big => "600x600>", \
      :medium => "300x300>", :thumb => "100x100>" }

  before_post_process :resize_images

  def resize_images
      return false unless image.content_type =~ %r{^(image|(x-)?\application)/(x-png|pjpeg|jpeg|jpg|png|gif)$}
  end

  default_scope :order => 'id DESC'

  acts_as_taggable

  def to_param
    "#{id}-#{title_url}"
  end
end
