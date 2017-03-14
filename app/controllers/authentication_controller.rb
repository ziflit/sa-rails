class AuthenticationController < ApplicationController
  include Authentication::Controller
  before_action :authenticate_request

  attr_reader :current_user

  def find_authenticable_entity(decoded_token)
    @current_user ||= User.find_by(id: decoded_token.fetch(:user_id))
  end

  def authenticable_entity_validation(entity)
    entity.verification_code
  end

  def entity_payload(entity)
    { user_id: entity.id }
  end

  def token_renew_id
    Devise.friendly_token(32)
  end

  def new_token_expiration_date
    (Time.zone.now + 30.days).to_i
  end
end
