# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # TODO: Add rescue to Authentication::Exceptions
  # rescue_from ActionController::ParameterMissing, with: :render_nothing_bad_req
  # rescue_from ActiveRecord::RecordNotFound, with: :render_nothing_bad_req
  protect_from_forgery with: :null_session

  private

  # Serializer methods
  def default_serializer_options
    { root: false }
  end

  # # This is a before action method. Returns false to stop from executing the other
  # # before action methods when it fails
  # def format_authentication_data(data)
  #   return unless data.present?
  #   response.headers.merge!(data[:headers]) if data[:headers].present?
  #   return unless data[:body].present?
  #   render json: data[:body], status: status_for_response(data[:code])
  #   false
  # end

  # def status_for_response(code)
  #   case code
  #   when Authentication::Manager::NOT_AUTH_CODE
  #     401
  #   when Authentication::Manager::TOKEN_EXPIRED_CODE
  #     401
  #   when Authentication::Manager::SUCCESS_CODE
  #     200
  #   end
  # end

  def render_nothing_bad_req
    head :bad_request
  end
end
