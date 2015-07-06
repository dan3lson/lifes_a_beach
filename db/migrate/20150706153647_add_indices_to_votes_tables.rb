class AddIndicesToVotesTables < ActiveRecord::Migration
  def change
    add_index :upvotes, [:user_id, :review_id], unique: true
    add_index :downvotes, [:user_id, :review_id], unique: true
  end
end
