class Board

  attr_reader :grid
  
  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end

  def add_move_to_grid(player)
    @grid[player[1]][player[2]] = player[0]
    # @grid
  end

end