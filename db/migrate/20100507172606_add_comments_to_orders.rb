class AddCommentsToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :comments, :string, :limit => 500
  end

  def self.down
    remove_column :orders, :comments
  end
end
