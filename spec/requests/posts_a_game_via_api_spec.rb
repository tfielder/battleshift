require 'rails_helper'

describe 'posts a game through the api' do
  it 'posts' do
    #create users
    user_1 = User.create!(name: "a", email: "b", password: "c", activated: true, api_key: "1111aaaa")

    user_2 = User.create!(name: "d", email: "e", password: "f", activated: true, api_key: "2222bbbb")

    post "/api/v1/games", params: {opponent_email: "#{user_2.email}", api_key: "#{user_1.api_key}" }, headers: { 'X-API-Key' => user_1.api_key }

    expect(response).to be_successful
  end
end
