class AddIndexesToBeaches < ActiveRecord::Migration
  def change
    add_index :beaches, :name, unique: true
    add_index :beaches, :city
    add_index :beaches, :state
    add_index :beaches, :zip
    add_index :beaches, :user_id
  end
end
