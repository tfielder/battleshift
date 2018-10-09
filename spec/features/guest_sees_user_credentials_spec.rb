require 'rails_helper'

feature 'user sees user credentials stored in the database' do
  scenario 'as a guest' do
    #Background: There is a user stored in the database with an id of 1, name of Josiah Bartlet, email of jbartlet@example.com
    # As a guest user
    # When I visit "/users/1"
    visit '/users/1'
    # Then I should see the user's name Josiah Bartlet
    expect(page).to have_content("Josiah Bartlet")
    # And I should see the user's email address jbartlet@example.com
    expect(page).to have_content("jbartlet@example.com")
  end
end