RSpec.shared_context 'Authenticated User' do
  let(:user) { create(:user) }
  let!(:access_data) { { token: Authentication::TokenManager.new(Rails.application.secrets.secret_key_base).encode(user_id: user.id), renew_id: Devise.friendly_token(32) } }
  let!(:access_token) { access_data[:token] }
  let!(:renew_id) { access_data[:renew_id] }

  before(:each) do
    request.headers['Authorization'] = access_token
  end
end
