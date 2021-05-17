class Bag < ApplicationRecord
  belongs_to :user

  validates :name, :description, :location, :rate, presence: true
end
