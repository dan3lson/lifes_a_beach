class Review < ActiveRecord::Base
  belongs_to :beaches

  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :user_id, presence: true
  validates :beach_id, presence: true
end
