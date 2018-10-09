require 'rails_helper'

feature "visitor can see an individual user's information" do
  scenario "by accessing URI" do
    # As a guest user
    # When I visit "/users/1"
    visit "/users/1"
    # Then I should see the user's name Josiah Bartlet
    expect(page).to have_content("Josiah Bartlet")
    # And I should see the user's email address jbartlet@example.com
    expect(page).to have_content("jbarlet@example.com")
  end

  feature "visitor can see all uses and their information" do
    scenario "by accessing URI" do
      # As a guest user
      # When I visit "/users/1"
      visit "/users"
      # Then I should see the user's name Josiah Bartlet
      expect(page).to have_content("Josiah Bartlet")
      expect(page).to have_content("Barry Joshy")
      # And I should see the user's email address jbartlet@example.com
      expect(page).to have_content("jbarlet@example.com")
      expect(page).to have_content("bj@example.com")
    end
  end
end
