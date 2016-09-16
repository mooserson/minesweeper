require_relative 'tile'
require_relative 'board'

class Game
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def setup
    @board.place_tiles
    @board.seed_bombs
  end

  def play
    until game_over?
      @board.render
      move = get_move until move == "f" || move == "r"
      pos = get_pos until valid_pos?(pos)
    end
  end

  def get_move
    puts "enter 'f' for Flag and 'r' for reveal"
    print " > "
    gets.chomp
  end

  def get_pos
    puts "enter move in x,y format"
    print " > "
    gets.chomp.split(",").map(&:to_i)
  end

  def valid_pos?(pos)
    if pos.all? {|x| x.between?(0,10)} && !@board[pos].revealed?
      return true
    end
    puts "Invalid move"
    false
  end


  def game_over?
    @board.won?
  end

end

b1 = Board.new
g1 = Game.new(b1)
g1.setup
