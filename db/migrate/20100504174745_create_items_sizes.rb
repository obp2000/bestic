class CreateItemsSizes < ActiveRecord::Migration
  def self.up
    create_table :items_sizes, :id => false do |t|
      t.integer :item_id, :null => false
      t.integer :size_id, :null => false 
      t.timestamps
    end
  end

  def self.down
    drop_table :items_sizes
  end
end
