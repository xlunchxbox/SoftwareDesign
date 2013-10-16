require File.expand_path('../../src/stock', __FILE__)

def read_file
  File.read("src/stocklist.txt")
end

def process_file
  stock_list = Hash.new
    read_file.each_line do |line|
    line_data = line.split(',')
    stock_list[line_data[0]] = line_data[1].chomp
  end
  stock_list
end

def get_prices_and_totals(stocks)
  master_list = Hash.new
  stocks.sort.each do |symbol, share|
    price = get_stock_value(symbol)
    master_list[symbol] = [share, price, calculate_net_asset_value(price, share.to_i)]  
  end
  master_list
end

def get_total_worth(stocks)
  net_asset_values = []
  stocks.sort.each do |symbol, share|
    net_asset_values << share[2]
  end
  calculate_total_worth(net_asset_values)
end


def display_information(stocks, total_worth)
  printf("%6s %10s %20s %10s \n", "SYMBOL", "PRICE", "NUMBER_OF_SHARES", "WORTH")
  stocks.sort.each do |symbol, share|
    printf("%6s %10s %20s %10s \n", "#{symbol}", "#{share[0]}", "#{share[1]}", "#{format("%.2f", share[2])}")
  end
  puts "Total: The total worth is: #{format("%.2f", total_worth)}"
end

master_list = get_prices_and_totals(process_file)
grand_total = get_total_worth(master_list)
display_information(master_list, grand_total)

