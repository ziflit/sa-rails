require 'rails_helper'

module Api
  module V1
    describe RentsController, type: :controller do
      include_context 'Authenticated User'
      describe 'GET #index' do
        before do
          get :index, params: { id: user.id }
        end

        context 'When a user has rents' do
          let(:rents) { create_list(:rent, 5, user: user) }

          it 'responds with all rents info' do
            expected = ActiveModel::Serializer::CollectionSerializer.new(
              rents, each_serializer: RentSerializer
            ).to_json
            expect(response_body.to_json) =~ JSON.parse(expected)
          end
        end

        context 'When a user doesnt have any rent' do
          it 'responds empty' do
            expect(response_body).to be_empty
          end
        end

        context 'When a user tries to access another users rents' do
          let(:another_user) { create(:user) }
          let!(:access_token) { AuthenticableEntity.generate_access_token(another_user)[:token] }
          it 'responds with unauthorized' do
            request.headers['Authorization'] = access_token
            get :index, params: { id: user.id }
            expect(response).to have_http_status(:unauthorized)
          end
        end
      end

      describe 'POST #create' do
        let(:book) { create(:book) }
        let(:rent) { create(:rent, user: user, book: book) }

        context 'When creating a valid rent' do
          before do
            post :create, params: { id: user.id, from: Time.zone.today, to: Time.zone.tomorrow,
                                    book_id: rent.book.id }
          end
          it 'responds with created' do
            expect(response).to have_http_status(:created)
          end
        end

        context 'When creating a duplicated rent' do
          before do
            post :create, params: { id: user.id, from: Time.zone.today, to: Time.zone.tomorrow,
                                    book_id: rent.book.id }
            post :create, params: { id: user.id, from: Time.zone.yesterday, to: 2.days.from_now,
                                    book_id: rent.book.id }
          end

          it 'responds with duplicated rent error' do
            expect(response).to have_http_status(:bad_request)
          end
        end
      end
    end
  end
end
