class CreateItemsColours < ActiveRecord::Migration
  def self.up
    create_table :items_colours, :id => false do |t|
      t.integer :item_id, :null => false
      t.integer :colour_id, :null => false 
      t.timestamps
    end
  end

  def self.down
    drop_table :items_colours
  end
end
