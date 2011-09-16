class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :title
      t.text :content
      
      t.boolean :visible, :default => true
      t.boolean :accessible, :default => true
      t.boolean :commentable, :default => true
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
