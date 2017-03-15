class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validate :duplicate_rent

  def duplicate_rent
    errors.add(:duplication, 'Book is already rented') if book.actual_rent.present?
  end
end
