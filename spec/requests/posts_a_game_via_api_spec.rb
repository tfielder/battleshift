require 'rails_helper'

describe 'posts a game through the api' do
  it 'posts' do
    #create users
    user_1 = User.create(name: "a", email: "b", password: "c", activated: true)
    user_2 = User.create(name: "d", email: "e", password: "f", activated: true, identity_token: 1234)

    post "/api/v1/games", params: {email: "#{user_1.email}", api_key: "#{user_2.identity_token}" }
    
    expect(response).to be_successful
  end
end