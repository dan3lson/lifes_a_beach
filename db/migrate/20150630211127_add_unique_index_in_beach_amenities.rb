class AddUniqueIndexInBeachAmenities < ActiveRecord::Migration
  def change
    add_index :beach_amenities, [:beach_id, :amenity_id], unique: true
  end
end
