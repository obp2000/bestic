class ChangeItemsAndCategories < ActiveRecord::Migration
  def self.up
    add_column :items, :season_id, :int    
    remove_column :categories, :season_id
  end

  def self.down
    remove_column :items, :season_id   
    add_column :categories, :season_id, :int    
  end
end
