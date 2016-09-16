require_relative 'tile'
require "byebug"
class Board
  attr_accessor :grid

  def initialize(grid = Array.new(9) {Array.new(9)} )
    @grid = grid
  end

  def place_tiles
    @grid.each_with_index do |row, i|
      row.each_with_index do |space, j|
        @grid[i][j] = Tile.new(@grid)
      end
    end
  end

  def seed_bombs
    10.times do
      row = rand(9)
      col = rand(9)
      @grid[row][col].bomb = true
    end
  end

  def render
    puts  "  #{(0..8).to_a.join(" ")}"
    @grid.each_with_index do |row, i|
      print "#{i} "
      row.each do |tile|
        print "#{get_symbol(tile)}|"
      end
      puts
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def get_symbol(tile)
    if tile.revealed && !tile.has_bomb?
      if tile.flag
        "F"
      else
         "_"
      end
    else
      "*"
    end
  end

  def won?
    @grid.all? do |row|
      row.all? do |tile|
        tile.revealed?
      end
    end
  end

end
