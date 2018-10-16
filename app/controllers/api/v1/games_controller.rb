module Api
  module V1
    class GamesController < ActionController::API
      def show
        game = Game.find(params[:id])
        render json: game
        # if Game.find_by_id(params[:id]) == nil
        #   render file: "public/404"
        # else
        #   game = Game.find(params[:id])
        #   render json: game
        # end
      end
    end
  end
end
