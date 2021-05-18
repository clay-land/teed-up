class Bag < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy

  validates :name, :description, :location, :rate, presence: true
end
