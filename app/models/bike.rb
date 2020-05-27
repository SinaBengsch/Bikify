class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :location, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }
end
