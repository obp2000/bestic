class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name, :limit => 100, :null => false
      t.integer :size_id, :null => false
      t.text :blurb
      t.float :price
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
