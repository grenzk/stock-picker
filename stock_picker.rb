# frozen_string_literal: true

require 'pry-byebug'

def stock_picker(stock_prices)
  profits = []
  prices_in_pairs = []

  stock_prices.each_with_index do |buy_price, index|
    stock_prices[(index + 1)..stock_prices.length].each do |sell_price|
      profits << sell_price - buy_price
      prices_in_pairs << [buy_price, sell_price]
    end
  end
  prices_in_pairs
    .select { |pair| pair[1] - pair[0] == profits.max }
    .flatten
    .map { |num| stock_prices.index(num) }
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
