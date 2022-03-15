# frozen_string_literal: true

require 'pry-byebug'

def stock_picker(stock_prices)
  profits = []
  prices_in_pairs = []

  stock_prices.each_with_index do |first_price, index|
    stock_prices[(index + 1)..stock_prices.length].each do |second_price|
      profits << second_price - first_price
      prices_in_pairs << [first_price, second_price]
    end
  end
  prices_in_pairs
    .select { |pair| pair[1] - pair[0] == profits.max }
    .flatten
    .map { |num| stock_prices.index(num) }
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
