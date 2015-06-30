class Amenity < ActiveRecord::Base
  has_many :beach_amenities
  has_many :beaches, through: :beach_amenities

  validates :name, presence: true, uniqueness: true

  def self.all_names
    amenities = []
    self.all.each { |a| amenities << a.name }
    amenities
  end
end
