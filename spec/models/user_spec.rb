require 'rails_helper'

describe User do
  describe 'user methods' do
    it 'creates new token' do
      token = User.new_token

      # expect(token).to be_a(SecureRandom)
    end
    it 'creates digest' do
      pass = User.digest("password")

      # expect(pass).to be_a(BCrypt::Password)
    end

    # it 'creates activation digest' do
    #
    # end

    it 'activates a user' do
      user_1 = User.create!(name: "a", email: "b", password: "c", api_key: "1111aaaa")

      expect(user_1.activated?).to be(false)
      user_1.activate
      expect(user_1.activated?).to be(true)
    end
  end
end