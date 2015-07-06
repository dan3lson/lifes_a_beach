class CreateVotingTables < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.integer :value, null: false, default: 1
    end

    create_table :downvotes do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.integer :value, null: false, default: -1
    end
  end
end
