require_relative 'recursive'

class MemoizedPipeCalculation < RecursivePipeCalculation
  def initialize
    @memoized_revenue_array = Hash.new
  end

  def compute_max_revenue(pipe_length, cost_sizes)
    if !@memoized_revenue_array.has_key?(pipe_length)
      @memoized_revenue_array[pipe_length] = super(pipe_length, cost_sizes)
    end
    @memoized_revenue_array[pipe_length]
  end
end