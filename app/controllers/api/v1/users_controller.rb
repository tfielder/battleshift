module Api
  module V1
    class UsersController < ApiController
      def index
        render json: User.all
      end

      def show
        render json: User.find(params[:id])
      end

      def update
        user = User.find(params[:id])
        updated_user = user.update(email: params[:email])
        render json: updated_user
      end
    end
  end
end
