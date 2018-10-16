require 'rails_helper'

describe BattleShiftService do
  describe "users" do
    it "finds all users" do
      json_response = File.open("./fixtures/all_users.json")
      stub_request(:get, "http://localhost:3000/api/v1/users").
        to_return(status: 200, body: json_response)

      api = BattleShiftService.new(@filter)
      users = api.fetch_users_data

      expect(users.count).to eq(2)
      expect(users[0][:name]).to eq("Josiah Bartlet")
      expect(users[0][:email]).to eq("jbarlet@example.com")
      expect(users[1][:name]).to eq("Barry Joshy")
      expect(users[1][:email]).to eq("bj@example.com")
    end
  end
end
