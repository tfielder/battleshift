require 'rails_helper'

describe UserResults do
  it "exists" do
    user_result = UserResults.new

    expect(user_result).to be_a(UserResults)
  end

  context "instance methods" do
    context "all_users" do
      it "returns a list of all users" do
        json_response = File.open("./fixtures/all_users.json")
        stub_request(:get, "http://localhost:3000/api/v1/users").
          to_return(status: 200, body: json_response)

        user_result = UserResults.new(@filter)

        expect(user_result.all_users.count).to eq(2)
      end
      it "returns a random token" do
        token = User.new_token
        
        expect(token.length).to eq(22)
      end
    end
  end
end
