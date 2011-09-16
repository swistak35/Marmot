class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :commenter
      t.text :content
      t.string :email
      t.string :www
      t.references :post

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
