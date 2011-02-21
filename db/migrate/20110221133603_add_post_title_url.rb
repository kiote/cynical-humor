class AddPostTitleUrl < ActiveRecord::Migration
  def self.up
    add_column :posts, :title_url, :string
    add_index :posts, :title_url, :unique => true
  end

  def self.down
    remove_index :posts, :title_url, :unique
    remove_column :posts, :title_url
  end
end
