require 'rails_helper'

feature "visitor can see all users and their information" do
  scenario "by accessing URI" do
    VCR.use_cassette("all_user.json") do

      visit "/users"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Josiah Bartlet")
      expect(page).to have_content("Barry Joshy")

      expect(page).to have_content("jbarlet@example.com")
      expect(page).to have_content("bj@example.com")
    end
  end
end
