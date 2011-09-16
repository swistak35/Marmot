class CreatePosttags < ActiveRecord::Migration
  def up
    create_table :posttags do |t|
      t.references :post
      t.references :tag
    end
  end

  def down
    drop_table :posttags
  end
end
