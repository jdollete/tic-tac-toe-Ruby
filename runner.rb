require_relative 'board'
require_relative 'game'
require_relative 'view'
require_relative 'marker'
require_relative 'check_winner'
require 'pry'

loop do

  puts "Welome!"
  puts "What size Tic-Tac-Toe Board would you like? (3-6):"
  board_size = gets.chomp
  break if board_size == "quit"

  game = Game.new(board: Board.new(size: board_size.to_i))
  game.start_game

  # binding.pry
  until game.game_over
    View.board_display(game.board.board_output, board_size)
    if game.next_turn == "player1"
      game.player1_move
    else
      game.player2_move
    end
    View.board_display(game.board.board_output, board_size)
    game_status = CheckWinner.board_check(game.board.board_output)
    game.game_over = game_status
  end

  puts "Winner Found"
  puts "Would you like to play again? (Yes/No)"
  user_answer = gets.chomp.downcase
  break if user_answer == "no"

end
