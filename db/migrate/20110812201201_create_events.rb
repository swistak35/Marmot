class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :name
      t.text :desc
      t.integer :kind
      t.boolean :allday
      t.timestamp :when
    end
  end

  def down
    drop_table :events
  end
end
