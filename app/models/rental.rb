class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :bag

  validates :start_date, :end_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "cannot be in the past") if start_date.present? && start_date < Date.today
  end

  def end_date_cannot_be_before_start_date
    errors.add(:end_date, "cannot be before start date") if end_date.present? && end_date < start_date
  end
end
