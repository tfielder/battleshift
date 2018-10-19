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

    if @messages.include?("Your shot resulted in a Hit. Battleship sunk. Game over.")
        if game.current_turn == "player_1"
          @messages << "Invalid move. Game over."
          game[:winner] = User.find_by_api_key(game.player_1_api_key).email
          game[:message] = "Invalid move. Game over."
          game.save
        elsif game.current_turn == "player_2"
          @messages << "Invalid move. Game over."
          game[:winner] = User.find_by_api_key(game.player_2_api_key).email
          game[:message] = "Invalid move. Game over."
          game.save
        end
    end

    if @game.current_turn == "player_1"
      @game.player_1_turns += 1
      @game.change_player
    elsif @game.current_turn == "player_2"
      @game.player_2_turns += 1
      @game.change_player
    end
  end

  # def ai_attack_back
  #   result = AiSpaceSelector.new(player.board).fire!
  #   @messages << "The computer's shot resulted in a #{result}."
  #   game.player_2_turns += 1
  # end

  def player
    Player.new(game.player_1_board)
  end

  def opponent
    if @game.current_turn == "player_2"
      Player.new(game.player_1_board)
    else
      Player.new(game.player_2_board)
    end
  end

end
