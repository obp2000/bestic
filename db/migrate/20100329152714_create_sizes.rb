class CreateSizes < ActiveRecord::Migration
  def self.up
    create_table :sizes do |t|
      t.string :name, :limit => 30, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :sizes
  end
end
