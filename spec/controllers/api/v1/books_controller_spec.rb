require 'rails_helper'

module Api
  module V1
    describe BooksController, type: :controller do
      include_context 'Authenticated User'

      describe 'GET #index' do
        let!(:books) { create_list(:book, 3) }
        context 'When fetching all books' do
          before do
            get :index
          end

          it 'responses with the books' do
            expected = ActiveModel::Serializer::CollectionSerializer.new(
              books, each_serializer: SimpleBookSerializer
            ).to_json
            expect(response_body.to_json) =~ JSON.parse(expected)
          end

          it 'responds with 200 status' do
            expect(response).to have_http_status(:ok)
          end
        end

        context 'When asking for an existing title, genre and author' do
          let(:title) { books.first.title }
          let(:genre) { books.first.genre }
          let(:author) { books.first.author }
          before do
            get :index, params: { title: title, genre: genre, author: author }
          end

          it 'responds with matching book' do
            expect(response_body).to include(include('title' => title,
                                                     'genre' => genre,
                                                     'author' => author))
          end
        end
      end

      describe 'GET #show' do
        let!(:book) { create(:book) }
        context 'When fetching a book with a current rent' do
          let!(:rent) { create(:rent, :actual, book: book, user: user) }
          before do
            get :show, params: { id: book.id }
          end

          it 'responds with the book info containing the rent' do
            expect(response_body.to_json).to eq BookSerializer.new(book).to_json
          end

          it 'responds with 200 status' do
            expect(response).to have_http_status(:ok)
          end
        end

        context 'When fetching a book with no current rent' do
          let!(:rent) { create(:rent, :expired, book: book, user: user) }
          before do
            get :show, params: { id: book.id }
          end

          it 'responds with the no rent info' do
            expect(response_body['actual_rent']).to be_nil
          end

          it 'responds with 200 status' do
            expect(response).to have_http_status(:ok)
          end
        end
      end
    end
  end
end
