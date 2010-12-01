class ChangePhotos < ActiveRecord::Migration
  def self.up
    remove_column :photos, :item_id
    remove_column :photos, :name
    add_column :photos, :item_id, :int
    add_column :photos, :name, :string
  end

  def self.down
    remove_column :photos, :item_id
    remove_column :photos, :name
    add_column :photos, :item_id, :int, :null => false
    add_column :photos, :name, :string, :null => false
  end
end
