class Cell
  attr_writer :neighbors

  def initialize(start_prob)
    @alive = start_prob > rand
  end

  def next!
    @alive = @neighbors == 3 || @alive && @neighbors == 2
  end

  def to_x
    @alive ? 1 : 0
  end
  
  def to_s
    @alive ? 'A' : ' '
  end


end

class Game
  
  def initialize(width, height, start_prob, rounds)
    @width, @height, @rounds = width, height, rounds
    @cells = Array.new(height) { 
      Array.new(width) { Cell.new(start_prob) } }  
    @neighbor = [[-1, 0],[1, 0],[-1, 1],[0, 1],[1, 1],[-1, -1],[0, -1], [1, -1]]
  end
  
  def play
    (1..@rounds).each_with_index do
      next!
      system('clear')
      puts self
    end
  end
  
  def next!
    @cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        cell.neighbors = neighbors(y, x)
      end
    end
    @cells.each { |row| row.each { |cell| cell.next! } }
  end
  
  def neighbors(y, x)
    @neighbor.inject(0) do |sum, cell|
      sum + @cells[(y + cell[0]) % @height][(x + cell[1]) % @width].to_x
    end
  end
  
  def to_s
    @cells.map { |row| row.join }.join("\n")
  end
end

Game.new(100, 100, 0.1, 30).play
