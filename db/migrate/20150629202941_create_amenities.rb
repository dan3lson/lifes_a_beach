class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.string :name, null: false
    end
  end
end
