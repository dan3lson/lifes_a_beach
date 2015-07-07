class Upvote < ActiveRecord::Base
  validates :user, presence: true, uniqueness: { scope: :review }
  validates :review, presence: true, uniqueness: { scope: :user }

  belongs_to :user
  belongs_to :review
end
