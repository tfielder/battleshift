require 'rails_helper'

describe 'posts a ship through the api' do
  it 'posts a ship' do
    user_1 = User.create!(name: "a", email: "b", password: "c", activated: true, api_key: "1111aaaa")

    user_2 = User.create!(name: "d", email: "e", password: "f", activated: true, api_key: "2222bbbb")

    ship_1_payload = {
      ship_size: 3,
      start_space: "A1",
      end_space: "A3"
    }.to_json

    game_attributes = {player_1_board: Board.new(4),
                       player_2_board: Board.new(4),
                       player_1_turns: 0,
                       player_2_turns: 0,
                       current_turn: 0
                      }

    game = Game.create(game_attributes)

    post "/api/v1/games", params: {opponent_email: "#{user_2.email}", api_key: "#{user_1.api_key}" }, headers: { 'X-API-Key' => user_1.api_key }
    expect(response).to be_successful
    expect(game.current_turn).to eq("player_1")
    expect(game.change_player).to eq("player_2")
    # endpoint = "/api/v1/games/#{game.id}/shots"
    # payload = {target: "A1"}.to_json
    # headers = { "CONTENT_TYPE" => "application/json", "X-API-KEY" => user_1.api_key  }
    #
    # response = post "/api/v1/games/#{game.id}/shots", params: payload, headers: headers
    #
    # expect(response).to be_successful
   end
end
