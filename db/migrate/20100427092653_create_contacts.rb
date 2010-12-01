class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :email, :limit => 50, :null => false
      t.string :name, :limit => 50
      t.string :phone, :limit => 50
      t.string :address, :limit => 100
      t.string :photo, :limit => 100
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
