Alive = true
Dead = false

def alive?(alive, neighbors_count)
   neighbors_count == 3 || alive && neighbors_count == 2
end

def detect_neighbors(grid, cell_row, cell_col)
  neighbor_counter = 0    
  
  if grid[cell_row - 1][cell_col - 1]
    neighbor_counter += 1
  end
  
  if grid[cell_row - 1][cell_col]
    neighbor_counter += 1
  end
  
  if grid[cell_row - 1][cell_col + 1]
    neighbor_counter += 1
  end
  
  if grid[cell_row][cell_col + 1]
    neighbor_counter += 1
  end
  
  if grid[cell_row + 1][cell_col + 1]
    neighbor_counter += 1
  end
  
  if grid[cell_row + 1][cell_col]
    neighbor_counter += 1
  end
  
  if grid[cell_row + 1][cell_col - 1]
    neighbor_counter += 1
  end
  
  if grid[cell_row][cell_col - 1]
    neighbor_counter += +1
  end
  neighbor_counter
end

def next_iteration(grid)
  next_iteration_live_cells = []

  neighbors_counter = 0

  grid.each_index do |row|
    grid.each_index do |col|
      neighbors_counter = detect_neighbors(grid, row - 1, col)

      if alive?(grid[row][col], neighbors_counter)
        next_iteration_live_cells << [row,col]
      end  
    end 
  end
  new_grid = place_live_cells_in_grid(create_grid, next_iteration_live_cells)
end

def create_grid
  grid = Array.new(10) do |row|
    Array.new(10) do |col|
      Dead
    end
  end
end

def place_live_cells_in_grid(grid, alive_cells)
  alive_cells.each do |row, col|
    grid[row][col] = Alive 
  end
  grid
end



