class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :description
      t.integer :beach_id, null: false
      t.integer :user_id, null: false
      t.integer :score, default: 0
    end
  end
end
