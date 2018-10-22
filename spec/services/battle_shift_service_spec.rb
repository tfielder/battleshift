require 'rails_helper'

describe BattleShiftService do
  describe "users" do
    xit "finds all users" do
      VCR.use_cassette("all_users_api") do

        api = BattleShiftService.new(@filter)
        users = api.fetch_users_data

        expect(users.count).to eq(4)
        expect(users[0][:name]).to eq("Josiah Bartlet")
        expect(users[0][:email]).to eq("jbarlet@example.com")
        expect(users[1][:name]).to eq("Barry Joshy")
        expect(users[1][:email]).to eq("bj@example.com")
      end
    end
      it "finds one user" do
        VCR.use_cassette("one_user_api") do

          @filter = 1
          api = BattleShiftService.new(@filter)
          users = api.fetch_one_user_data

          expect(users[:name]).to eq("Josiah Bartlet")
          expect(users[:email]).to eq("crazy@gmail.com")
        end
      end
  end
end
