require 'rails_helper'

describe User do
  it "exists" do
    user = User.new

    expect(user).to be_a(User)
  end

  context "class methods" do
    it "returns a random token" do
      token = User.new_token

      expect(token.length).to eq(22)
    end
  end

  context "instance methods" do
    it "#create_api_key" do
      user = User.create!(name: "a", email: "b", password: "c", activated: true, api_key: "1111aaaa")
      key = user.create_api_key

      expect(key.length).to eq(22)
    end
    
  end
end
