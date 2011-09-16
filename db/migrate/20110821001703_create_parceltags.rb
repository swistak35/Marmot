class CreateParceltags < ActiveRecord::Migration
  def up
    create_table :parceltags do |t|
      t.references :parcel
      t.references :tag
    end
  end

  def down
    drop_table :parceltags
  end
end


