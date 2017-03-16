module Api
  module V1
    class RentsController < ApplicationController
      def index
        rents = Rent.where(user_id: params[:id])
        render json: rents
      end

      def create
        rent = CreateRent.call(params: create_params, user: current_user)
        if rent.success?
          head :created
        else
          render json: { errors: rent.error }, status: :bad_request
        end
      end

      private

      def create_params
        params.permit(:from, :to, :book_id)
      end
    end
  end
end
