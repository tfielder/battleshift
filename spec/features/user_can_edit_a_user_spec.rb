require 'rails_helper'

feature "user can edit a user's information" do
  scenario "by using user edit form" do
    # json_response = File.open("./fixtures/all_users.json")
    # stub_request(:get, "https://young-tundra-64543.herokuapp.com/api/v1/users").
    #   to_return(status: 200, body: json_response)

    # As a guest user
    # When I visit "/users"
    visit "/users"
    # And I click on `Edit` for Josiah Bartlet
    within first('.user').click_link('Edit User')
    # Then I should be on "/users/1/edit"
    expect(current_path).to eq("/users/1/edit")
    # When I fill in the email field with "josiah@example.com"
    fill_in "email", with: "crazy@gmail.com"
    fill_in "password", with: "1234"
    # And I click "Save"
    # json_response = File.open("./fixtures/user_id_one.json")
    # stub_request(:patch, "https://young-tundra-64543.herokuapp.com/api/v1/users/1").
      # to_return(status: 200, body: json_response)

    click_on("Save")

    # json_response = File.open("./fixtures/all_users_edited.json")
    # stub_request(:get, "https://young-tundra-64543.herokuapp.com/api/v1/users").
    #   to_return(status: 200, body: json_response)
    # Then I should be on "/users"
    expect(current_path).to eq("/users")
    # And I should see a flash message that says "Successfully updated Josiah Bartlet."
    expect(page).to have_content("Successfully updated Josiah Bartlet")
    # And I should should see Josiah Bartlet's email show up in the list as "josiah@example.com"
    expect(page).to have_content("crazy@gmail.com")
  end
end
