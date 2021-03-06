require 'rails_helper'

feature "user can edit a user's information" do
  it "by using user edit form" do

    visit "/users"
    # And I click on `Edit` for Josiah Bartlet
    within first('.user').click_link('Edit User')
    # Then I should be on "/users/1/edit"
    expect(current_path).to eq("/users/1/edit")
    # When I fill in the email field with "josiah@example.com"
    fill_in "email", with: "crazy@gmail.com"

    click_on("Save")

    expect(current_path).to eq("/users")
    # And I should see a flash message that says "Successfully updated Josiah Bartlet."
    expect(page).to have_content("Successfully updated Josiah Bartlet")
    # And I should should see Josiah Bartlet's email show up in the list as "josiah@example.com"
    expect(page).to have_content("crazy@gmail.com")
  end
end
