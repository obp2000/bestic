class AddCommentsToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :comment, :string, :limit => 50
  end

  def self.down
    remove_column :photos, :comment 
  end
end
