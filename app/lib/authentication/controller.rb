module Authentication
  module Controller
    def authenticate_request
      entity = find_authenticable_entity(decoded_token)
      decoded_token.validate!(authenticable_entity_validation(entity))
    end

    def generate_access_token(entity)
      renew_id = token_renew_id
      payload = entity_payload(entity).merge(
        verification_code: authenticable_entity_validation(entity),
        expiration_date: new_token_expiration_date,
        renew_id: renew_id
      )
      { token: TokenManager.new(token_key).encode(payload), renew_id: renew_id }
    end

    def renew_access_token
      payload = decoded_token.payload
      payload[:expiration_date] = new_token_expiration_date
      Authentication::TokenManager.encode(payload)
    end

    def decoded_token
      @decoded_token ||= TokenManager.new(token_key).decode(authentication_token)
    end

    ##
    # Helpers intended to override in controller class
    #

    def new_token_expiration_date
      raise Authentication::Exceptions::SubclassMustImplementError
    end

    def token_key
      raise Authentication::Exceptions::SubclassMustImplementError unless defined?(Rails)
      raise NoKeyProvidedError if Rails.application.secrets.secret_key_base.nil?
      Rails.application.secrets.secret_key_base
    end

    def authentication_token
      request.headers['Authorization'].split(' ').last
    end

    def find_authenticable_entity(decoded_token)
      raise Authentication::Exceptions::SubclassMustImplementError
    end

    def authenticable_entity_validation
      nil
    end

    def payload(entity)
      raise Authentication::Exceptions::SubclassMustImplementError
    end
  end
end
