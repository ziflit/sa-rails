module Authentication
  module Controller
    def authenticate_request
      data = Authentication::Manager.authenticate(request.headers)
      format_authentication_data(data)
    end

    def current_user
      @current_user ||= Authentication::Manager.current_user
    end
  end
end
