require 'rails_helper'

feature 'user sees user credentials stored in the database' do
  scenario 'as a guest it shows an individual user on a show page' do
    #Background: There is a user stored in the database with an id of 1, name of Josiah Bartlet, email of jbartlet@example.com
    # As a guest user
    # When I visit "/users/1
    visit "/users/1"
    # Then I should see the user's name Josiah Bartlet
    expect(page).to have_content("Josiah Bartlet")
    expect(page).to have_css(".name")
    # And I should see the user's email address jbartlet@example.com
    expect(page).to have_content("jbarlet@example.com")
    expect(page).to have_css(".email")
  end
  scenario 'as a guest' do

    visit "/users"

    expect(page).to have_content("Smalls")
    expect(page).to have_content("Clark")
    expect(page).to have_css(".name")


    expect(page).to have_content("small@example.com")
    expect(page).to have_content("smallville@town.com")
    expect(page).to have_css(".email")

  end
end