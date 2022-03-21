# frozen_string_literal: true

require 'pry-byebug'

def stock_picker(stock_prices)
  profits = []
  pairs_of_prices = []

  stock_prices.each_with_index do |buy_price, index|
    stock_prices[(index + 1)..-1].each do |sell_price|
      profits << sell_price - buy_price
      pairs_of_prices << [buy_price, sell_price]
    end
  end
  get_pair_of_days(pairs_of_prices, profits, stock_prices)
end

def get_pair_of_days(pairs_of_prices, profits, stock_prices)
  pairs_of_prices
    .select { |pair| pair[1] - pair[0] == profits.max }
    .flatten
    .map { |num| stock_prices.index(num) }
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
