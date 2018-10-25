class TurnProcessor
  def initialize(game, target)
    @game   = game
    @target = target
    @messages = []
  end

  def run!
    begin
      attack_opponent
      #ai_attack_back
      game.save!
    rescue InvalidAttack => e
      @messages << e.message
    end
  end

  def message
    @messages.join(" ")
  end

  private

  attr_reader :game, :target

  def attack_opponent
    result = Shooter.fire!(board: opponent.board, target: target)
    @messages << "Your shot resulted in a #{result}."

    game_over

    switch_turns
  end

  def includes_message(player)
    @messages << "Invalid move. Game over."
    game[:winner] = User.find_by_api_key(player).email
    game[:message] = "Invalid move. Game over."
    game.save
  end

  def switch_turns
    if @game.current_turn == "player_1"
      @game.player_1_turns += 1
      @game.change_player
    elsif @game.current_turn == "player_2"
      @game.player_2_turns += 1
      @game.change_player
    end
  end

  def game_over
    if @messages.include?("Your shot resulted in a Hit. Battleship sunk. Game over.") && game.current_turn == "player_1"
      includes_message(game.player_1_api_key)
    elsif @messages.include?("Your shot resulted in a Hit. Battleship sunk. Game over.") && game.current_turn == "player_2"
      includes_message(game.player_2_api_key)
    end
  end

  # def player
  #   Player.new(game.player_1_board)
  # end

  def opponent
    if @game.current_turn == "player_2"
      Player.new(game.player_1_board)
    else
      Player.new(game.player_2_board)
    end
  end

end
