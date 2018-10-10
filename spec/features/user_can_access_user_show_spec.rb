require 'rails_helper'

feature "visitor can see an individual user's information" do
  scenario "by accessing URI" do
    VCR.use_cassette("one_user") do
    # As a guest user
    # When I visit "/users/1"
    visit "/users/1"
    # Then I should see the user's name Josiah Bartlet
    expect(page).to have_content("Josiah Bartlet")
    # And I should see the user's email address jbartlet@example.com
    expect(page).to have_content("jbarlet@example.com")
    end
  end
end

feature "visitor can see all users and their information" do
  scenario "by accessing URI" do
    json_response = File.open("./fixtures/all_users.json")
    stub_request(:get, "http://localhost:3000/api/v1/users").
      to_return(status: 200, body: json_response)
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
