require 'rails_helper'

describe 'as an activated user' do
  it 'allows a user to create a game with valid email and API key' do
    #create 2 users and activate
    player_1 = User.create!(name: "Samwise", email: "littlehouse@theshire.com", password: "mr.frodo!", activated: true)
    player_2 = User.create!(name: "Frodo", email: "mrunderhill@theshire.com", password: "my!preciouse", activated: true)

    email = "littlehouse@theshire.com"
    password = "mr.frodo!"
    visit '/'

    click_on "Login"

    expect(current_path).to eq(login_path)

    fill_in "email", with: email
    fill_in "password", with: password

    click_on "Login"

    expect(current_path).to eq(dashboard_path)
    save_and_open_page
    #fill_in "API key", with: player_1.api_key
    fill_in "api_key", with: player_1.identity_token
    #fill_in "Player_2 email", with: player_2.email
    fill_in "opponent_email", with: player_2.email
    #expect(page).to have_content("Opponent's email:")
    expect(page).to have_content("Your opponent's email:")
    #expect(page).to have_content("Your API key")
    expect(page).to have_content("Your api key (check your registration email)")
    #click_on "create game"
    click_on "Create Game"
    #expect(current_path).to eq('game/new')
    expect(current_path).to eq('/games')
  end
end