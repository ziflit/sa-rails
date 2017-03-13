module Api
  module V1
    class BooksController < AuthenticationController
      def show
        book = Book.find(params[:id])
        render json: book
      end

      def index
        books = Book.filter(filtering_params(params))
        render json: books, each_serializer: SimpleBookSerializer
      end

      private

      def filtering_params(params)
        params.permit(:genre, :author, :title)
      end
    end
  end
end
