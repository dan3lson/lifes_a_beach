class Review < ActiveRecord::Base
  belongs_to :beach
  belongs_to :user

  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :user_id, presence: true
  validates :beach_id, presence: true
  validates :user_id, uniqueness: {
    scope: :beach_id,
    message: "can only submit one review for a beach."
  }
end
