require 'rails_helper'

describe 'user visits homepage' do
  it 'allows visitor to see homepage' do
    visit '/'

    expect(current_path).to eq('/')

    expect(page).to have_content("Register")
    expect(page).to have_content("Login")
    expect(page).to have_content("Welcome")
  end
end