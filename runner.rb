require_relative 'board'
require_relative 'game'
require_relative 'view'
require_relative 'marker'
require_relative 'check_winner'
require_relative 'check_draw'

# Welcome Interface ------------------------------------

system 'clear'
puts "Welcome!"
puts "What is your name: "
user_name = gets.chomp

loop do
  valid_board_size = false
  puts "What size Tic-Tac-Toe Board would you like? (3-10):"

  while valid_board_size !=true
    board_size = gets.chomp

    if (3..10).to_a.include?(board_size.to_i)
      valid_board_size = true
    else
      puts "Invalid board size, please pick between 3-10"
    end

    break if board_size == "quit"
  end

  game = Game.new(board: Board.new(size: board_size.to_i))
  game.start_game

  # Controller -----------------------------------------

  until game.game_over
    View.board_display(game.board.board_output, board_size)

    if game.next_turn == "player1"
      current_player = user_name
      game.player1_move
    else
      current_player = "Computer"
      game.player2_move
    end

    View.board_display(game.board.board_output, board_size)

    game_status = CheckWinner.board_check(game.board.board_output)
    game.game_over = game_status

    if game_status != true
      draw_status = CheckDraw.check_draw(game.board.board_output)

      if draw_status == true
        game.game_over = true
      end

    end
  end

  # Game Over ------------------------------------------

  if draw_status == true
    puts "Game ended in a draw!!"
  else
    puts "#{current_player} Is The Winner!!!!!"
  end

  puts "Would you like to play again? (Yes/No)"
  valid_answer = false

  while valid_answer == false
    user_answer = gets.chomp.downcase
    if user_answer == "yes" || user_answer == "no"
      exit if user_answer == "no"
      valid_answer = true
    else
      puts "Please type yes or no..."
    end
  end

  system 'clear'
end
