require 'open-uri'

def calculate_net_asset_value(price, number_of_shares)
  price * number_of_shares
end

def calculate_total_worth(net_asset_values)
  net_asset_values.inject(0, :+)
end

def get_stock_value(symbol)
  begin
    open("http://ichart.finance.yahoo.com/table.csv?s=#{symbol.chomp}").to_a[1].split(',').last.to_f
  rescue
    0
  end
end


