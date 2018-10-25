require 'rails_helper'

describe "Api::V1::Ships" do
  context "POST /api/v1/games/:id/ships" do
    let(:player_1_board)   { Board.new(4) }
    let(:player_2_board)   { Board.new(4) }
    let(:lg_ship) { 3 }
    let(:sm_ship) { 2 }
    let(:game)    {
      create(:game,
        player_1_board: player_1_board,
        player_2_board: player_2_board
      )
    }

    it 'places a ship for player 1' do

      headers = { "CONTENT_TYPE" => "application/json",
                  "X-API-Key" => "aaaa"
                }
      json_payload = {board: player_1_board, ship_size: lg_ship, start_space: "A1", end_space: "A3"}.to_json

      post "/api/v1/games/#{game.id}/ships", params: json_payload, headers: headers

      expect(response).to be_success

      game = JSON.parse(response.body, symbolize_names: true)

      expected_messages = "Successfully placed ship with a size of 3. You have 1 ship(s) to place with a size of 2."

      expect(game[:message]).to eq expected_messages
    end

    it 'places a ship for player 2' do

      headers = { "CONTENT_TYPE" => "application/json",
                  "X-API-Key" => "bbbb"
                }
      json_payload = {board: player_2_board, ship_size: lg_ship, start_space: "A1", end_space: "A3"}.to_json

      post "/api/v1/games/#{game.id}/ships", params: json_payload, headers: headers

      expect(response).to be_success

      game = JSON.parse(response.body, symbolize_names: true)

      expected_messages = "Successfully placed ship with a size of 3. You have 1 ship(s) to place with a size of 2."

      expect(game[:message]).to eq expected_messages
    end
  end
end