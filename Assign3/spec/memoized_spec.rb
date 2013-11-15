$:.unshift(File.join(File.dirname(__FILE__), '..','src'))

require 'pipe'

require 'simplecov'
SimpleCov.start

require 'memoized'

require 'rspec'

describe 'pipe store' do
  it_behaves_like 'Pipes' do
    let(:pipe){MemoizedPipeCalculation.new}
  end
end