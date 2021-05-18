class Bag < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many_attached :photos

  validates :name, :description, :location, :rate, presence: true
end
