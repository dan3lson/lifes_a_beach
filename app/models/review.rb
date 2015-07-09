class Review < ActiveRecord::Base
  belongs_to :beach
  belongs_to :user
  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy

  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :user_id, presence: true
  validates :beach_id, presence: true
  validates :user_id, uniqueness: {
    scope: :beach,
    message: "can only submit one review for a beach."
  }

  def score
    upvotes.count - downvotes.count
  end

  def upvotes_from(user)
    upvotes.find_by(user_id: user.id)
  end

  def downvotes_from(user)
    downvotes.find_by(user_id: user.id)
  end
end
