class RemoveTableVotes < ActiveRecord::Migration
  def up
    drop_table :votes
  end

  def down
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.integer :value, default: 0
    end
  end
end
