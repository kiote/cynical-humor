class Post < ActiveRecord::Base
  belongs_to :user
end

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

