class AddSizesAndColoursToOrderItems < ActiveRecord::Migration
  def self.up
    add_column :order_items, :size_id, :int
    add_column :order_items, :colour_id, :int
  end

  def self.down
    remove_column :order_items, :size_id
    remove_column :order_items, :colour_id
  end
end
