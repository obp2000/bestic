class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id 
      t.float :price 
      t.integer :amount 
      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
