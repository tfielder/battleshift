require 'rails_helper'

feature "visitor can see an individual user's information" do
  scenario "by accessing URI" do
    VCR.use_cassette("one_user") do
    # As a guest user
    # When I visit "/users/1"
    visit "/users/1"
    # Then I should see the user's name Josiah Bartlet
    expect(page).to have_content("Josiah Bartlet")
    expect(page).to have_content("jbarlet@example.com")
    end
  end
end
