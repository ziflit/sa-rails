module Api
  module V1
    class RentsController < ApplicationController
      def index
        authorize User.find(params[:id]), :rents_index?
        rents = Rent.where(user_id: params[:id])
        render json: rents
      end

      def create
        rent = Rent.new(create_params.merge(user: current_user))
        if rent.save
          head :created
        else
          render json: { errors: rent.errors }, status: :bad_request
        end
      end

      private

      def create_params
        params.permit(:from, :to, :book_id)
      end
    end
  end
end
