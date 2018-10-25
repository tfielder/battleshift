require 'rails_helper'

describe 'as a user clicking on the link to activate account' do
  xit 'activates a user' do
    user_1 = User.create!(name: "a", email: "b", password: "c", api_key: "1111aaaa")
    @current_user = user_1
    expect(user_1.activated).to be(false)

    params = {email: user_1.email}

    get "account_activations/#{user_1.id}/edit", params
    # edit_account_activation_url(user_1.id), params

    expect(response).to be_successful
    #visit edit_account_activation_url(user_1.id), params[:email] = "b"
    expect(user_1.activated).to be(true)
    expect(current_path).to eq(dashboard_path)
  end
end