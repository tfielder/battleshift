require 'rails_helper'

describe 'posts a ship through the api' do
  it 'posts a ship' do
    #create users
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

    #note need to update the payload/params perhaps so that it resembles that of the spec harness.

    post "/api/v1/games", params: {opponent_email: "#{user_2.email}", api_key: "#{user_1.api_key}" }, headers: { 'X-API-Key' => user_1.api_key }

    expect(response).to be_successful
  end
end
