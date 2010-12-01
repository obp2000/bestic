class CreateCartItems < ActiveRecord::Migration
  def self.up
    create_table :cart_items do |t|
      t.integer :item_id
      t.integer :cart_id
      t.float :price
      t.integer :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :cart_items
  end
end
