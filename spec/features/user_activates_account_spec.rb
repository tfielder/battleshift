require 'rails_helper'

describe 'as a user clicking on the link to activate account' do
  it 'activates a user' do
    user_1 = User.create!(name: "a", email: "b", password: "c", api_key: "1111aaaa")

    expect(user_1.activated).to be(false)

    email = user_1.email
    id = user_1.id

    visit edit_account_activation_url(user_1.api_key, email: user_1.email)
    expect(current_path).to eq(dashboard_path)
    expect(User.find(id).activated?).to be(true)
    expect(page).to have_content("Thank you! Your account is now activated.")
  end
  it 'doesnt activate a user if without token' do
    user_1 = User.create!(name: "a", email: "b", password: "c", activated: true, api_key: "1111aaaa")

    expect(user_1.activated).to be(true)

    email = user_1.email
    id = user_1.id

    visit edit_account_activation_url(user_1.api_key, email: user_1.email)
    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end