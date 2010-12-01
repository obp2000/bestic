class CreateForumPosts < ActiveRecord::Migration
  def self.up
    create_table :forum_posts do |t|
      t.string :name, :limit => 50, :null => false
      t.string :subject, :limit => 255, :null => false
      t.text :body
      t.integer :root_id, :null => false, :default => 0
      t.integer :parent_id, :null => false, :default => 0
      t.integer :lft, :null => false, :default => 0
      t.integer :rgt, :null => false, :default => 0
      t.integer :depth, :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :forum_posts
  end
end
