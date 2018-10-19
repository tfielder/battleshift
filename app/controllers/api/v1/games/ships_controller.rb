module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create
          game = Game.find(params[:game_id])
          #if request.headers["X-API-Key"] == Figaro.env.BATTLESHIFT_API_KEY
          if request.headers["X-API-Key"] == game.player_1_api_key
            ship_processor_1 = ShipPlacer.new(board: game.player_1_board, ship: Ship.new(params[:ship_size]), start_space: params[:start_space], end_space: params[:end_space])
            ship_processor_1.run
            message = ship_processor_1.message(params[:ship_size])
          #elsif request.headers["X-API-Key"] == Figaro.env.BATTLESHIFT_OPPONENT_API_KEY
          elsif request.headers["X-API-Key"] == game.player_2_api_key
            ship_processor_2 = ShipPlacer.new(board: game.player_2_board, ship: Ship.new(params[:ship_size]), start_space: params[:start_space], end_space: params[:end_space])
            ship_processor_2.run
            message = ship_processor_2.message(params[:ship_size])
          end

          game.save

          render json: game, message: message
        end
      end
    end
  end
end
