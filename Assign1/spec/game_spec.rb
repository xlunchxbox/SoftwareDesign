require 'rspec'
require File.expand_path('../../src/game', __FILE__)

def create_grid(size)
  grid = Array.new(size) do |row|
    Array.new(size) do |col|
      DEAD
    end
  end
end

def place_neighbor_in_grid(grid, neighbor_locations)
  neighbor_locations.each do |row, col|
    grid[row][col] = ALIVE
  end
  grid
end

describe 'Rules' do
  ALIVE = true
  DEAD = false
  
  describe 'Rule #1: Any live cell with fewer than two live neighbours dies, as if caused by under-population.' do
    
    it 'cell with 0 neighbors should be dead' do
      should_not be_alive(ALIVE, 0)
    end
    
    it 'cell with 1 neighbors should be dead' do
      should_not be_alive(ALIVE, 1)
    end
    
    it 'dead cell with 0 neighbors should remain dead' do
      should_not be_alive(DEAD, 0)
    end
    
    it 'dead cell with 1 neighbors should remain dead' do
      should_not be_alive(DEAD, 1)
    end
    
  end

  describe 'Rule #2: Any live cell with two or three live neighbours lives on to the next generation.' do
    
    it 'cell with 2 neighbors should be alive' do
      should be_alive(ALIVE, 2);
    end
    
    it 'cell with 3 neighbors should be alive' do
      should be_alive(ALIVE, 3);
    end
    
    it 'dead cell with 2 neighbors should remain dead' do 
      should_not be_alive(DEAD, 2);
    end
  end
  
  describe 'Rule #3: Any live cell with more than three live neighbours dies, as if by overcrowding.' do
    
    it 'cell with 4 neighbors should be dead' do
      should_not be_alive(ALIVE, 4);
    end
    
    it 'cell with 8 neighbors should be dead' do
      should_not be_alive(ALIVE, 8);
    end
    
    it 'dead cell with 4 neighbors should remain dead' do
      should_not be_alive(DEAD, 4);
    end
    
    it 'dead cell with 8 neighbors should remain dead' do
      should_not be_alive(DEAD, 8);
    end
    
  end
  
  describe 'Rule #4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.' do
    it 'cell with exatcly 3 cells should be alive' do
     should be_alive(DEAD, 3)
    end
  end
end

describe 'neighbors' do
  neighbor_locations = [[1,1], [1,2], [1,3], [2,1], [2,3], [3,1], [3,2], [3,3]]
  cell_row = 2
  cell_col = 2
  size = 5
  
    it 'neighbor should be detected to the north east' do
      grid = create_grid(size)
      place_neighbor_in_grid(grid, neighbor_locations)
      detect_neighbors(grid, cell_row, cell_col).should_not == 1
    end
    
    it 'neighbor should be detected to the north' do
      grid = create_grid(size)
      place_neighbor_in_grid(grid, neighbor_locations)
      detect_neighbors(grid, cell_row, cell_col).should_not == 1
    end
    
    it 'neighbor should be detected to the north west' do
      grid = create_grid(size)
      place_neighbor_in_grid(grid, neighbor_locations)
      detect_neighbors(grid, cell_row, cell_col).should_not == 1
    end
    
    it 'neighbor should be detected to the east' do
      grid = create_grid(size)
      place_neighbor_in_grid(grid, neighbor_locations)
      detect_neighbors(grid, cell_row, cell_col).should_not == 1
    end
    
    it 'neighbor should be detected to the south east' do
      grid = create_grid(size)
      place_neighbor_in_grid(grid, neighbor_locations)
      detect_neighbors(grid, cell_row, cell_col).should_not == 1
    end
    
    it 'neighbor should be detected to the south' do
      grid = create_grid(size)
      place_neighbor_in_grid(grid, neighbor_locations)
      detect_neighbors(grid, cell_row, cell_col).should_not == 1
    end
    
    it 'neighbor should be detected to the south west' do
      grid = create_grid(size)
      place_neighbor_in_grid(grid, neighbor_locations)
      detect_neighbors(grid, cell_row, cell_col).should_not == 1
    end
    
    it 'neighbor should be detected to the west' do
      grid = create_grid(size)
      place_neighbor_in_grid(grid, neighbor_locations)
      detect_neighbors(grid, cell_row, cell_col).should_not == 1
    end
    
    it 'grid should be empty if all cells are dead' do
      grid = create_grid(size)
      detect_neighbors(grid, cell_row, cell_col).should == 0
    end
end


