class Downvote < ActiveRecord::Base
  validates :value, numericality: { only_integer: true }
  validates :user, presence: true
  validates :review, presence: true

  belongs_to :user
  belongs_to :review
end
