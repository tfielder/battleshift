require 'rails_helper'

RSpec.describe Game, type: :model do
  it "exists" do
    game = Game.new

    expect(game).to be_a(Game)
  end
end
