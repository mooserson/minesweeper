class Tile
  attr_accessor :bomb, :revealed, :flag, :board

  def initialize(board)
    @board = board
    @bomb = false
    @revealed = false
    @flag = false
  end

  def has_bomb?
    @bomb
  end

  def has_flag?
    @flag
  end

  def revealed?
    @revealed
  end

  def reveal
    @revealed = true
  end

  def neighbors(pos)
    neighbors = []

  end

end
