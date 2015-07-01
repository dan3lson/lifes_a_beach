class BeachAmenity < ActiveRecord::Base
  belongs_to :beach
  belongs_to :amenity

  validates :beach, presence: true
  validates :amenity, presence: true
end
