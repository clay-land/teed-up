class Bag < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many_attached :photos

  validates :name, :description, :location, :rate, presence: true
  validates :rate, numericality: { greater_than_or_equal_to: 0 }
end
