require_relative 'board'
require 'pry'

puts "Welome!"
puts "What size Tic-Tac-Toe Board would you like? (3-6)?"
board_size = gets.chomp

game_board = Board.new(size: 4)
