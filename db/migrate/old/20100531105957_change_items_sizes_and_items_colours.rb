class ChangeItemsSizesAndItemsColours < ActiveRecord::Migration
  def self.up
    remove_column :items_sizes, :item_id
    remove_column :items_sizes, :size_id
    add_column :items_sizes, :item_id, :int
    add_column :items_sizes, :size_id, :int
    
    remove_column :items_colours, :item_id
    remove_column :items_colours, :colour_id
    add_column :items_colours, :item_id, :int
    add_column :items_colours, :colour_id, :int
  end

  def self.down
    remove_column :items_sizes, :item_id
    remove_column :items_sizes, :size_id
    add_column :items_sizes, :item_id, :int, :null => false
    add_column :items_sizes, :size_id, :int, :null => false
    
    remove_column :items_colours, :item_id
    remove_column :items_colours, :colour_id
    add_column :items_colours, :item_id, :int, :null => false
    add_column :items_colours, :colour_id, :int, :null => false
  end
end
