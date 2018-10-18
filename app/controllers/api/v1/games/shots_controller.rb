module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          game = Game.find(params[:game_id])
          # if (request.headers["X-API-Key"] == Figaro.env.BATTLESHIFT_API_KEY) && game.current_turn == "player_1"
          #
          # elsif (request.headers["X-API-Key"] == Figaro.env.BATTLESHIFT_OPPONENT_API_KEY) && game.current_turn == "player_2"
          #
          # end
          #stopping here it says it's player's one turn so the player is not updating
          turn_processor = TurnProcessor.new(game, params[:shot][:target])
          #update player 1 here game.update(:current_turn) = toggle
          turn_processor.run!
          render json: game, message: turn_processor.message
        end
      end
    end
  end
end
