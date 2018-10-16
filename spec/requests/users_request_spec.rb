require 'rails_helper'

describe "users api endpoints" do
  context "GET /api/v1/users" do
    xit "returns a list of users" do
      create_list(:user, 2)

      get "/api/v1/users"

      expect(response.status).to be 200

      users = JSON.parse(response.body, symbolize_names: true)
      user  = users.first

      expect(users.count).to eq(2)
      expect(user.keys.count).to eq(3)
      expect(user).to have_key(:name)
      expect(user).to have_key(:email)
      expect(user).to have_key(:id)
    end
  end

  context "GET /api/v1/users/:id" do
    xit "returns a specific user" do
      cj   = User.create!(name: "C.J. Cregg", id: 111, email: "2@example.com", password: "1234")
      toby = User.create!(name: "Toby Ziegler", id: 222, email: "3@example.com", password: "1234")

      get "/api/v1/users/#{cj.id}"

      expect(response.status).to be 200

      returned_user = JSON.parse(response.body, symbolize_names: true)

      expect(returned_user.keys.count).to eq(3)
      expect(returned_user).to have_key(:name)
      expect(returned_user).to have_key(:email)
      expect(returned_user).to have_key(:id)
    end
  end

  context "PATCH /api/v1/users/:id" do
    xit "can edit a user's information" do
      cj   = User.create!(name: "C.J. Cregg", id: 111, email: "yoyo@example.com", password: "1234")

      patch "/api/v1/users/#{cj.id}", params:  {"email": "cj@gmail.com"}

      expect(response.status).to be 200

      returned_user = JSON.parse(response.body, symbolize_names: true)
      user_email = returned_user[:email]
      expect(returned_user).to have_key(:email)
      expect(user_email).to eq("cj@gmail.com")
    end
  end
end
