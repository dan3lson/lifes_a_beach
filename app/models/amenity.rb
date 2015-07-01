class Amenity < ActiveRecord::Base
  has_many :beach_amenities
  has_many :beaches, through: :beach_amenities

  validates :name, presence: true, uniqueness: true

  def self.all_names
    self.all.map { |amenity| amenity.name }
  end
end
