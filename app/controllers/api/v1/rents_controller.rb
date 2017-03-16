module Api
  module V1
    class RentsController < ApplicationController
      def index
        rents = Rent.where(user_id: params[:id])
        render json: rents
      end

      def create
        interactor = CreateRent.call(params: create_params, user: current_user)
        unless interactor.success?
          return render json: { errors: interactor.error }, status: :bad_request
        end
        head :created
      end

      private

      def create_params
        params.permit(:from, :to, :book_id)
      end
    end
  end
end
