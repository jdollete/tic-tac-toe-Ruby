require_relative 'board'
require_relative 'game'
require_relative 'view'
require_relative 'marker'
require 'pry'

loop do

  puts "Welome!"
  puts "What size Tic-Tac-Toe Board would you like? (3-6):"
  board_size = gets.chomp
  break if board_size == "quit"

  game_board = Board.new(size: board_size.to_i)

  game = Game.new(board: game_board)

  View.board(game.board, board_size)

end
