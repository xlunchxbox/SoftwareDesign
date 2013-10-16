require 'simplecov'
SimpleCov.start

require 'rspec'
require File.expand_path('../../src/stock', __FILE__)

require 'webmock/rspec'
include WebMock::API

describe 'integration tests' do
  describe 'testing for valid data' do
    before (:each) do
      WebMock.allow_net_connect!
    end
    
    it 'sending a valid symbol should return number greater than 0' do
      get_stock_value("GOOG").should > 0
    end
    
    it 'sending an invalid symbol should return 0' do
      get_stock_value("EVMI").should == 0
    end
  end
end