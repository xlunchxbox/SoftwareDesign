require 'Benchmark'
require File.expand_path('../../src/recursive', __FILE__)
require File.expand_path('../../src/memoized', __FILE__)

def read_file
  File.read("src/pipe_costs.txt").split(",")
end

def display_revenue(pipe_length, timing, type)
  printf "Pipe Length: #{pipe_length}\n"
  printf "#{type}: #{format("%.8f", timing)} seconds\n\n"
end

revenue_list = read_file

pipe = RecursivePipeCalculation.new
memo_pipe = MemoizedPipeCalculation.new

time_one = Benchmark.realtime{revenue_recursive = pipe.compute_max_revenue(revenue_list[0].to_i, revenue_list)}
time_two = Benchmark.realtime{revenue_memoized = memo_pipe.compute_max_revenue(revenue_list[0].to_i, revenue_list)}

display_revenue(revenue_list[0].to_i, time_one, "Recursive")
display_revenue(revenue_list[0].to_i, time_two, "Memoized")
