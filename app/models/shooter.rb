class Shooter
  def initialize(board:, target:)
    @board     = board
    @target    = target
    @message   = ""
  end

  def fire!
    if valid_shot?
      message = space.attack!
        if message.include?("Hit")
          @board.add_hit
            if @board.game_over?
              message = "Hit. Battleship sunk. Game over"
            end
            message
        end
      message
    else
      raise InvalidAttack.new("Invalid coordinates.")
    end
  end

  def self.fire!(board:, target:)
    new(board: board, target: target).fire!
  end

  private
    attr_reader :board, :target

    def space
      @space ||= board.locate_space(target)
    end

    def valid_shot?
      board.space_names.include?(target)
    end
end

class InvalidAttack < StandardError
  def initialize(msg = "Invalid attack.")
    super(msg)
  end
end
