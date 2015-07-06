class Upvote < ActiveRecord::Base
  validates :user, presence: true
  validates :review, presence: true

  belongs_to :user
  belongs_to :review
end
