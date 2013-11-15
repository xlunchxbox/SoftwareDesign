$:.unshift(File.join(File.dirname(__FILE__), '..','src'))

require 'recursive'
require 'memoized'

require 'simplecov'
SimpleCov.start

require 'rspec'

require 'Benchmark'

describe 'Memoized vs Recursive' do
  cost_sizes = [10, 1, 2, 2, 4, 4, 5, 6, 6, 7, 8]
  pipe = RecursivePipeCalculation.new
  memo_pipe = MemoizedPipeCalculation.new
  
  it 'Memoized timing should be less than recursive timing' do
    time_one = Benchmark.realtime{pipe.compute_max_revenue(10, cost_sizes)}
    time_two = Benchmark.realtime{memo_pipe.compute_max_revenue(10, cost_sizes)}
    (time_one / time_two).should > 10
  end
end