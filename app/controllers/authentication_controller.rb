class AuthenticationController < ApplicationController
  include Authentication::Controller
  before_action :authenticate_request

  # def authorization_header
  #   headers['Authorization']
  # end
end
