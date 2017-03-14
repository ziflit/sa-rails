# require 'rails_helper'
#
# module Api
#   module V1
#     describe SessionsController do
#       describe '#create' do
#         it 'creates a session and generates tokens for access' do
#           user = create(:user)
#           post :create, params: { sessions: { email: user.email, password: user.password } }
#           expect(response).to have_http_status(:ok)
#           expect(response_body['renew_id']).to be_truthy
#           expect(response_body['access_token']).to be_truthy
#         end
#       end
#     end
#   end
# end
