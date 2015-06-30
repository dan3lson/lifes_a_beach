class AddUniqueIndexToReviews < ActiveRecord::Migration
  def change
    add_index(:reviews, [:beach_id, :user_id], unique: true)
  end
end
