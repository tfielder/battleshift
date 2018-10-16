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
                           current_turn: "challenger"
                          }
        game = Game.create(game_attributes)
        render json: game
      end
    end
  end
end
