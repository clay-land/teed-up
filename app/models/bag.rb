class Bag < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :description, :location, :rate, presence: true
  validates :rate, numericality: { greater_than_or_equal_to: 0 }
  include PgSearch::Model
  pg_search_scope :search_by_loc,
    against: :location,
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  pg_search_scope :search_by_brand,
    against: { name: "A", description: "B" },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
