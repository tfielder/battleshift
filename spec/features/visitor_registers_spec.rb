require 'rails_helper'

describe 'as a guest user' do
  xit 'allows visitor to create a log in' do
    email = "mike@mike.com"
    name = "Mike"
    password = "hamburger1"

    visit '/'
  # And I click "Register"
    click_on "Register"
  # Then I should be on "/register"
    expect(current_path).to eq('/register')
  # And when I fill in an email address (required)
    fill_in "user[email]", with: email
  # And I fill in name (required)
    fill_in "user[name]", with: name
  # And I fill in password and password confirmation (required)
    fill_in "user[password]", with: password
    fill_in "user[password_confirmation]", with: password
  # And I click submit
    click_on "Submit"
  # Then I should be redirected to "/dashboard"
    expect(current_path).to eq("/dashboard")
  # And I should see a message that says "Logged in as <SOME_NAME>"
    expect(page).to have_content("Logged in as Mike")
  # And I should see "This account has not yet been activated. Please check your email."
    expect(page).to have_content("This account has not yet been activated. Please check your email.")
  end
end