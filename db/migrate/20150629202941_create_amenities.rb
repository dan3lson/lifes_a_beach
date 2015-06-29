class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.boolean :dog_allowed, default: false
      t.boolean :volleyball_court, default: false
      t.boolean :shower, default: false
      t.boolean :grill, default: false
      t.boolean :permit_required, default: false
      t.boolean :fishing, default: false
      t.boolean :picnic, default: false
      t.boolean :boardwalk, default: false
      t.boolean :parking, default: false
      t.boolean :food_vendor, default: false
      t.boolean :bathroom, default: false
    end
  end
end
