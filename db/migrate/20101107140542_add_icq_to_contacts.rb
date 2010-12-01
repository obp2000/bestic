class AddIcqToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :icq, :string, :limit => 20       
  end

  def self.down
    remove_column :contacts, :icq 
  end
end
