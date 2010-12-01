class CreateColours < ActiveRecord::Migration
  def self.up
    create_table :colours do |t|
      t.string :name, :null => false
      t.string :photo
      t.timestamps
    end
  end

  def self.down
    drop_table :colours
  end
end
