class AddIconsToSeasons < ActiveRecord::Migration
  def self.up
    add_column :seasons, :icon, :string, :limit => 50
  end

  def self.down
    remove_column :seasons, :icon
  end
end
