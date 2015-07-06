class RemoveColumnValuesFromVotesTables < ActiveRecord::Migration
  def change
    remove_column :upvotes, :value, :integer
    remove_column :downvotes, :value, :integer
  end
end
