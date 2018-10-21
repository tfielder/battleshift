class Board
  attr_reader :length,
              :board

  def initialize(length)
    @length = length
    @board = create_grid
    @hit = 0
  end

  def add_hit
    @hit += 1
  end

  def game_over?
    @hit == 5
  end
end
