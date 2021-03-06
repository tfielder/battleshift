player_1_board = Board.new(4)
player_2_board = Board.new(4)

sm_ship = Ship.new(2)
md_ship = Ship.new(3)

# Place Player 1 ships
ShipPlacer.new(board: player_1_board,
               ship: sm_ship,
               start_space: "A1",
               end_space: "A2").run

ShipPlacer.new(board: player_1_board,
               ship: md_ship,
               start_space: "B1",
               end_space: "D1").run

# Place Player 2 ships
ShipPlacer.new(board: player_2_board,
               ship: sm_ship.dup,
               start_space: "A1",
               end_space: "A2").run

ShipPlacer.new(board: player_2_board,
               ship: md_ship.dup,
               start_space: "B1",
               end_space: "D1").run

game_attributes = {
  player_1_board: player_1_board,
  player_2_board: player_2_board,
  player_1_turns: 0,
  player_2_turns: 0,
  current_turn: 0
}

game = Game.new(game_attributes)
game.save!

user_1 = User.create!(name: "Josiah Bartlet", email: "jbarlet@example.com", address: "1600 Pennsylvania Ave NW, Washington, DC 20500", password: "1234", activated: true, activated_at: Time.zone.now, api_key: "cool")
user_2 = User.create!(name: "Barry Joshy", email: "bj@example.com", address: "16 Pen Ave NW, Seattle, Washington 20500", password: "1234", activated: true, activated_at: Time.zone.now, api_key: "super")
user_1 = User.create!(name: "Montgomery", email: "hello@example.com", address: "1600 Pennsylvania Ave NW, Washington, DC 20500", password: "1234", activated: true, activated_at: Time.zone.now, api_key: "evyiYMExhwCS15JmBM7dkRjq")
user_2 = User.create!(name: "Mishka", email: "opponent@example", address: "16 Pen Ave NW, Seattle, Washington 20500", password: "1234", activated: true, activated_at: Time.zone.now, api_key: "cezhzkVCEzUP1zzvubCGMWiF")