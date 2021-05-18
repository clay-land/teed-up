class Bag < ApplicationRecord
  belongs_to :user
  has_many :users, through: :rentals

  validates :name, :description, :location, :rate, presence: true
end
