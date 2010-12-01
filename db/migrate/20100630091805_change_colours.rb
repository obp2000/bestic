class ChangeColours < ActiveRecord::Migration
  def self.up
    remove_column :colours, :html_code
    add_column :colours, :html_code, :string, :limit => 50
  end

  def self.down
    remove_column :colours, :html_code
    add_column :colours, :html_code, :string, :limit => 6
  end
end
