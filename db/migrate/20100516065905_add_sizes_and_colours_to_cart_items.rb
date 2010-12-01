class AddSizesAndColoursToCartItems < ActiveRecord::Migration
  def self.up
    add_column :cart_items, :size_id, :int
    add_column :cart_items, :colour_id, :int
  end

  def self.down
    remove_column :cart_items, :size_id
    remove_column :cart_items, :colour_id
  end
end
