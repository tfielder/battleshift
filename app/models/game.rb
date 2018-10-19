class Game < ApplicationRecord
  attr_accessor :messages

  # enum current_turn: ["challenger", "computer"]
  enum current_turn: ["player_1", "player_2"]
  # enum winner: ["#{User.find_by_api_key(self.player_1_api_key).email}", "#{User.find_by_api_key(self.player_2_api_key).email}"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def change_player
    if self.current_turn == "player_1"
      self.current_turn = "player_2"
    else
      self.current_turn = "player_1"
    end
  end
end
