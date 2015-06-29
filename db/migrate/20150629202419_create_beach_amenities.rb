class CreateBeachAmenities < ActiveRecord::Migration
  def change
    create_table :beach_amenities do |t|
      t.integer :beach_id, null: false
      t.integer :amenity_id, null: false
      t.timestamps null: false
    end
  end
end
