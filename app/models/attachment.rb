class Attachment < ActiveRecord::Base
  belongs_to :post

  has_attached_file :attachment, :styles => { :big => "600x600>", \
      :medium => "300x300>", :thumb => "100x100>" }
end
