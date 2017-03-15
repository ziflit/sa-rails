class Book < ApplicationRecord
  include Filterable

  validates :title, :author, :genre, :year, :publisher, :image, presence: true

  scope :with_author, ->(author) { where(author: author) }
  scope :with_title, ->(title) { where(title: title) }
  scope :with_genre, ->(genre) { where(genre: genre) }

  has_many :rents

  def actual_rent
    rents.find_by('rents.from <= :date AND rents.to >= :date', date: Time.zone.today)
  end
end
