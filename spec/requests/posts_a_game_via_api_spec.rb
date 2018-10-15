require 'rails_helper'

describe 'user can start a game' do
  it 'posts a game through the api' do
    #create users
    #user_1 = create()
    #create game API token

    post '/api/v1/games' #params?
    #game created
    expect(response).to be_successful
  end
end