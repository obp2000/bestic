class AddSeasonsToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :season_id, :int
  end

  def self.down
    remove_column :categories, :season_id 
  end
end
