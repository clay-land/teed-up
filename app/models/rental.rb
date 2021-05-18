class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :bag

  # need to test default accepted boolean
  validates :start_date, :end_date, presence: true
end
