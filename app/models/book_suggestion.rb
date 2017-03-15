class BookSuggestion < ApplicationRecord
  belongs_to :user

  validates :title, :author, :link, :user, presence: true
end
