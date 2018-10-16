require 'rails_helper'

describe 'user can start a game' do
  xit 'posts a game through the api' do
    #create users
    user_1 = User.create(name: "a", email: "b", password: "c", activated: true)
    user_2 = User.create(name: "d", email: "e", password: "f", activated: true)
    #create game API token
    #game = Game.create

    post "/api/v1/games/#{game.id}" #params?
    #game created
    expect(response).to be_successful
  end
end