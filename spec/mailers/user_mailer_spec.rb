require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    user = User.create!(name: "C.J. Cregg", email: "new@example.org", password: "1234", api_key: "11111aaaaa")

    let(:mail) { UserMailer.account_activation(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Battleshift Account Activation")
      expect(mail.to).to eq(["new@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to have_content("Be sure to save this API key to register a game of Battleshift:")
      expect(mail.body.encoded).to have_content("Welcome to Battleshift!")
      expect(mail.body.encoded).to have_content("Click on the link to activate your account:")
    end
  end
end
