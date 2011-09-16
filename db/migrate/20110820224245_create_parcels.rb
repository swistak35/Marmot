class CreateParcels < ActiveRecord::Migration
  def up
    create_table :parcels do |t|
      t.string :parcel_file_name
      t.string :parcel_content_type
      t.integer :parcel_file_size
      t.datetime :parcel_updated_at
    end
  end

  def down
    drop_table :parcels
  end
end
