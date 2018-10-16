module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create
          game = Game.find(params[:game_id])

          #render json: game, message: turn_processor.message
          render json: game
        end
      end
    end
  end
end
