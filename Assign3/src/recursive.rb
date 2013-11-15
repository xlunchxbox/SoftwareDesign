class RecursivePipeCalculation

  def compute_max_revenue(pipe_length, cost_sizes)
    max_revenue = cost_sizes[pipe_length]
  
     (1...pipe_length).each do |i|
      max_revenue = [max_revenue, compute_max_revenue(i, cost_sizes) + 
                                  compute_max_revenue(pipe_length - i, cost_sizes)].max
     end
    max_revenue
  end
  
end