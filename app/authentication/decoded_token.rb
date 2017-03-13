module Authentication
  class DecodedToken
    def initialize(payload)
      @payload = payload
    end

    def fetch(key)
      return @payload[key.to_sym] if !@payload[key.to_sym].nil?
      return @payload[key.to_s] if !@payload[key.to_s].nil?
      nil
    end

    def expired?
      return false unless fetch(:expiration_date).present?
      Time.zone.now.to_i > fetch(:expiration_date)
    end

    def valid_verification_code?
      return true unless fetch(:verification_code).present?
      User.find(fetch(:user_id)).verification_code == fetch(:verification_code)
    end

    def warning_expiration_date_reached?
      return false unless fetch(:warning_expiration_date).present?
      Time.zone.now.to_i >= fetch(:warning_expiration_date)
    end

    def valid_renew_id?(renew_id)
      return true unless fetch(:renew_id).present? && renew_id.present?
      renew_id == fetch(:renew_id)
    end

    def able_to_renew?
      return true unless fetch(:expiration_date).present? && fetch(:maximum_useful_date).present?
      fetch(:expiration_date) < fetch(:maximum_useful_date)
    end
  end
end
