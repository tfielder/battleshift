module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          game = Game.find(params[:game_id])
          if game.winner != nil

            render json: game, status: 400, message: "Invalid move. Game over."
          else
            #if (request.headers["X-API-Key"] == Figaro.env.BATTLESHIFT_API_KEY) && game.current_turn == "player_1"
            if (request.headers["X-API-Key"] == game.player_1_api_key) && game.current_turn == "player_1"
              turn_processor = TurnProcessor.new(game, params[:shot][:target])
              turn_processor.run!
              message = turn_processor.message
              if message == "Invalid coordinates."
                render json: game, status: 400, message: "Invalid coordinates"
              else
                render json: game, message: message
              end
              #elsif (request.headers["X-API-Key"] == Figaro.env.BATTLESHIFT_OPPONENT_API_KEY) && game.current_turn == "player_2"
            elsif (request.headers["X-API-Key"] == game.player_2_api_key) && game.current_turn == "player_2"
              turn_processor = TurnProcessor.new(game, params[:shot][:target])
              turn_processor.run!
              message = turn_processor.message
              if message == "Invalid coordinates."
                render json: game, status: 400, message: "Invalid coordinates"
              else
                render json: game, message: message
              end
            else
              if !User.find_by_api_key(request.headers["X-API-Key"]).nil?
                render json: game, status: 400, message: "Invalid move. It's your opponent's turn"
              else
                render json: game, status: 401, message: "Unauthorized"
              end
            end
          end
        end
      end
    end
  end
end
