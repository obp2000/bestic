class RemoveSizeIdFromItems < ActiveRecord::Migration
  def self.up
    remove_column :items, :size_id
  end

  def self.down
    add_column :items, :size_id, :int
  end
end
