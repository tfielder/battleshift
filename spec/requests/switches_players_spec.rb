# require 'rails_helper'
#
# describe 'game switches player turn' do
#   it 'player_1 turn' do
#     user_1 = User.create!(name: "a", email: "b", password: "c", activated: true, api_key: "1111aaaa")
#     user_2 = User.create!(name: "d", email: "e", password: "f", activated: true, api_key: "2222bbbb")
#
#     ship_1_payload = {
#       ship_size: 3,
#       start_space: "A1",
#       end_space: "A3"
#     }.to_json
#
#     game_attributes = {
#       player_1_board: Board.new(4),
#                        player_2_board: Board.new(4),
#                        player_1_turns: 0,
#                        player_2_turns: 0,
#                        current_turn: 0
#                       }
#
#     game = Game.create(game_attributes)
#     post "/api/v1/games", params: {opponent_email: "#{user_2.email}", api_key: "#{user_1.api_key}" }, headers: { 'X-API-Key' => user_1.api_key }
#     result = JSON.parse(response.body, symbolize_names: true)
#     expect(response).to be_successful
#     expect(result[:message]).to include("Successfully placed ship with a size of 3. You have 1 ship(s) to place with a size of 2.")
#
#     endpoint = "/api/v1/games/1/shots"
#     payload = {target: "A1"}.to_json
#     headers = { "CONTENT_TYPE" => "application/json", "X-API-KEY" => user_1.api_key  }
#     # response = post_json(endpoint, payload)
#     # response = post "/api/v1/games/1/shots", params: , headers: { 'X-API-Key' => user_1.api_key }
#     response = post "/api/v1/games/1/shots", params: payload, headers: headers
#     # game = response.body
#     expect(response).to eq(200)
#   end
# end
