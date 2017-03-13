module Authentication
  module Controller
    def authenticate_request
      data = Authentication::Manager.authenticate(authorization_header)
      format_authentication_data(data)
    end
  end
end
