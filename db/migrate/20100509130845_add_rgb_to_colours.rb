class AddRgbToColours < ActiveRecord::Migration
  def self.up
    add_column :colours, :html_code, :string, :limit => 6
    add_column :colours, :name_eng, :string, :limit => 50
  end

  def self.down
    remove_column :colours, :html_code
    remove_column :colours, :name_eng
  end
end
