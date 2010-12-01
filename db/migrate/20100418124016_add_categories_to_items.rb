class AddCategoriesToItems < ActiveRecord::Migration
  def self.up
        add_column :items, :category_id, :int
  end

  def self.down
        remove_column :items, :category_id 
  end
end
