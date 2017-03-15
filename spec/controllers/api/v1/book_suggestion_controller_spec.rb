require 'rails_helper'

module Api
  module V1
    describe BookSuggestionsController, type: :controller do
      describe 'POST #create' do
        let(:user) { create(:user) }
        context 'When a guest user creates a new suggestion' do
          let!(:suggestion) { create(:book_suggestion, user: user) }

          it 'creates a new rent' do
            expect do
              post :create, params: { title: suggestion.title, author: suggestion.author,
                                      publisher: suggestion.publisher, year: suggestion.year,
                                      link: suggestion.link, editorial: suggestion.editorial,
                                      price: suggestion.price, user_id: user }
            end.to change { BookSuggestion.count }.by(1)
          end

          it 'responds with 201' do
            post :create, params: { title: suggestion.title, author: suggestion.author,
                                    publisher: suggestion.publisher, year: suggestion.year,
                                    link: suggestion.link, editorial: suggestion.editorial,
                                    price: suggestion.price, user_id: user }
            expect(response).to have_http_status(:created)
          end
        end

        context 'When trying to create an invalid suggestion' do
          it 'responds with bad_request' do
            post :create, params: { user_id: user }
            expect(response).to have_http_status(:bad_request)
          end
        end
      end
    end
  end
end
