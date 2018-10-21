module Api
  module V1
    class GamesController < ActionController::API
      def show
        game = Game.find(params[:id])
        render json: game
      end

      def create
        game_attributes = {player_1_board: Board.new(4),
                           player_2_board: Board.new(4),
                           player_1_turns: 0,
                           player_2_turns: 0,
                           current_turn: 0
                          }
        game = Game.create(game_attributes)
        game.player_1_api_key = request.headers["X-API-Key"]
        # player_2 = User.find_by(email: params[:opponent_email])
        email = params[:opponent_email]
        player_2 = User.find_by_email(email)
        game.player_2_api_key = player_2.api_key
        game.save
        render json: game
      end

      private

        def paramers
          params.require(:opponent_email)
        end
    end
  end
end
