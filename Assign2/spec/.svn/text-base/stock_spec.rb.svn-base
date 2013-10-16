require 'simplecov'
SimpleCov.start

require 'rspec'
require File.expand_path('../../src/stock', __FILE__)

require 'webmock/rspec'
include WebMock::API


describe 'stocks' do
  describe 'computational logic' do  
    describe 'calculate net asset value'
    
    it 'sending two positive numbers should return a positive number' do
      5000 == calculate_net_asset_value(10, 500).should
    end
    
    it 'sending two negative numbers should return a positive number' do
      5000 == calculate_net_asset_value(-10, -500).should
    end
    
    it 'sending a negative and a positive number should return a negative number' do
      -5000 == calculate_net_asset_value(10, -500).should
    end
    
    it 'sending a number greater then zero and zero should return 0' do
      0 == calculate_net_asset_value(0, 500).should
    end
    
    it 'sending a number less then zero and zero should return 0' do
      0 == calculate_net_asset_value(0, -500).should
    end
  end  
  
  describe 'calculate total worth' do
    numbers_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    empty_list =[]
    
    it 'sending empty array should return 0' do
      0 == calculate_total_worth(empty_list).should
    end
    
    it 'sending array of numbers should return total of all numbers' do
      55 == calculate_total_worth(numbers_list).should
    end
  end
  
  describe 'Requesting data from web service' do
    before(:each) do
      stub_request(:get, "http://ichart.finance.yahoo.com/table.csv?s=GOOG").to_return(:body => "{\"price\":\"100.00\"}")
    end
    
    it 'sending symbol should return stock price' do
      get_stock_value("GOOG")
      WebMock.should have_requested(:get, "http://ichart.finance.yahoo.com/table.csv?s=GOOG")
    end
  end
  
  describe 'Request data from web service when down' do
    before(:each) do
      stub_request(:get, 'http://ichart.finance.yahoo.com/table.csv?s=GOOG').to_raise("0")
    end
    it 'should be handled gracefully' do
      get_stock_value("GOOG")
      WebMock.should have_requested(:get, "http://ichart.finance.yahoo.com/table.csv?s=GOOG")
    end
  end
end



