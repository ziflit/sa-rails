module Api
  module V1
    class BookSuggestionsController < ApplicationController
      skip_before_action :authenticate_request, only: [:create]
      def create
        book_suggestion = BookSuggestion.new(params.permit(
                                               :title, :author, :publisher, :year, :link,
                                               :editorial, :user_id, :price
        ))
        return head :created if book_suggestion.save
        render json: book_suggestion.errors, status: :bad_request
      end
    end
  end
end
