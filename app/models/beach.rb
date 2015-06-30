class Beach < ActiveRecord::Base
  belongs_to :user

  validates :street1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :name, presence: true, uniqueness: true
  validates :entrance_fee, presence: true
  validates :picture_url, presence: true
  validates :description, presence: true
  validates :user, presence: true
end
