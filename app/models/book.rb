class Book < ApplicationRecord
  validates :title, :author, :genre, :year, :publisher, :image, presence: true
end
