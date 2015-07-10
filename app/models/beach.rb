class Beach < ActiveRecord::Base
  belongs_to :user
  has_many :beach_amenities
  has_many :amenities, through: :beach_amenities
  has_many :reviews, dependent: :destroy

  mount_uploader :picture_url, BeachPhotoUploader

  validates :street1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :name, presence: true, uniqueness: true
  validates :entrance_fee, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  def total_score
    total_score = 0
    self.reviews.each do |review|
      total_score += review.score
    end
    return total_score
  end

  def self.search(query)
    if query.split.size == 1
      @beaches = Beach.joins(:amenities).where(
        "beaches.name ILIKE ? OR
        beaches.description ILIKE ? OR
        beaches.city ILIKE ? OR
        beaches.state ILIKE ? OR
        beaches.zip ILIKE ? OR
        amenities.name ILIKE ?",
        "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%",
        "%#{query}%"
      )
    else
      container = []
      query_string = query.split.map do
        "(beaches.name ILIKE ? OR
        beaches.description ILIKE ? OR
        beaches.city ILIKE ? OR
        beaches.state ILIKE ? OR
        beaches.zip ILIKE ? OR
        amenities.name ILIKE ?) AND "
      end

      container << query_string.inject(:+).rpartition(" AND ").first
      query.split.each { |word| 6.times { container << "%#{word}%" } }

      @beaches = Beach.joins(:amenities).where(container.flatten)
    end
  end
end
