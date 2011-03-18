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

  # relations
  belongs_to :user
  has_many :attachments

  # validations
  validates_presence_of :title, :title_url

  # attributes
  cattr_reader :per_page
  @@per_page = 10

  # attached_file
  has_attached_file :image, :styles => { :big => "600x600>", \
      :medium => "300x300>", :thumb => "100x100>" }

  before_post_process :resize_images

  def resize_images
      return false unless image.content_type =~ %r{^(image|(x-)?\application)/(x-png|pjpeg|jpeg|jpg|png|gif)$}
  end

  # nested attributes
  accepts_nested_attributes_for :attachments, :allow_destroy => true

  # scopes
  default_scope :order => 'id DESC'

  # tags
  acts_as_taggable

  def to_param
    "#{id}-#{title_url}"
  end
end
