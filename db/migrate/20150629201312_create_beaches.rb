class CreateBeaches < ActiveRecord::Migration
  def change
    create_table :beaches do |t|
      t.string :street1, null: false
      t.string :street2, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :name, null: false
      t.integer :entrance_fee
      t.string :picture_url
      t.text :description
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
