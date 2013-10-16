require 'green_shoes'
require File.expand_path('../../src/game', __FILE__)

ALIVE = true
DEAD = false

#initial_cells = [[1,1], [1,2], [1,3], [2,1], [2,2], [2,3], [3,1], [3,2], [3,3]]
initial_cells = [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7], [8,8], [9,9], [0,9], [1,8], [2,7], [3,6], [4,5], [5,4], [6,3], [7,2], [8,1], [9,0]]


grid = place_live_cells_in_grid(create_grid, initial_cells)


x_coord = 50
y_coord = 50



Shoes.app :title => "Game of Life", :width => 600, :height => 600 do
  background black
    animate(2) do |i|
    grid.each_index do |row|
      grid.each_index do |col|
        if grid[row][col] == ALIVE
          rect x_coord, y_coord, 50,
          fill:[white]
        else
          rect x_coord, y_coord, 50,
          fill:[red]
        end
        x_coord += 50
      end
      x_coord -= 500
      y_coord += 50 
    end
    x_coord = 50
    y_coord = 50
    grid = next_iteration(grid)
    end
end