class Game < ApplicationRecord
  attr_accessor :messages

  # enum current_turn: ["challenger", "computer"]
  enum current_turn: ["player_1", "player_2"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def change_player
    if current_turn == 0
      current_turn = 1
    else
      current_turn = 0
    end
  end
end
