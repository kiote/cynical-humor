class AddUniqTitleUrl < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      update posts set title_url = md5(rand());
    SQL
  end

  def self.down
  end
end
