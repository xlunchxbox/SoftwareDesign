require 'rspec'

module Pipe_tests
  shared_examples 'Pipes' do 
    cost_sizes = [10, 1, 2, 2, 4, 4, 5, 6, 6, 7, 8]
    
    it 'Given a pipe size and prices find max revenue' do
      1 == pipe.compute_max_revenue(1, cost_sizes).should
    end

    it 'Given a pipe size and prices find max revenue' do
      2 == pipe.compute_max_revenue(2, cost_sizes).should
    end

    it 'Given a pipe size and prices find max revenue' do
      3 == pipe.compute_max_revenue(3, cost_sizes).should
    end

    it 'Given a pipe size and prices find max revenue' do
      4 == pipe.compute_max_revenue(4, cost_sizes).should
    end

    it 'Given a pipe size and prices find max revenue' do
      5 == pipe.compute_max_revenue(5, cost_sizes).should
    end

    it 'Given a pipe size and prices find max revenue' do
      6 == pipe.compute_max_revenue(6, cost_sizes).should
    end

    it 'Given a pipe size and prices find max revenue' do
      7 == pipe.compute_max_revenue(7, cost_sizes).should
    end

    it 'Given a pipe size and prices find max revenue' do
      8 == pipe.compute_max_revenue(8, cost_sizes).should
    end

    it 'Given a pipe size and prices find max revenue' do
      9 == pipe.compute_max_revenue(9, cost_sizes).should
    end

    it 'Given a pipe size and prices find max revenue' do
      10 == pipe.compute_max_revenue(10, cost_sizes).should
    end   
  end
end