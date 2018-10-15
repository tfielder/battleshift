require 'rails_helper'

describe 'as an activated user' do
  it 'allows a user to create a game with valid email and API key' do
    #create 2 users and activate
    player_1 = User.create(name: "Samwise", email: "littlehouse@theshire.com", password: "mr.frodo!", activated: true)
    player_2 = User.create(name: "Frodo", email: "mrunderhill@theshire.com", password: "my!preciouse", activated: true)
    #set the session for player_1
    #visit '/dashboard'
    visit '/dashboard'
    #click_on "create game"
    click_on "Create Game"
    #expect(current_path).to eq('game/new')
    expect(current_path).to eq('game/new')
    #fill_in "API key", with: player_1.api_key
    fill_in "API key", with: player_1.identity_token
    #fill_in "Player_2 email", with: player_2.email
    fill_in "Player_2 email", with: player_2.email
    #expect(page).to have_content("Opponent's email:")
    expect(page).to have_content("Opponent's email:")
    #expect(page).to have_content("Your API key")
    expect(page).to have_content("Your API key (check your email)")
  end
end