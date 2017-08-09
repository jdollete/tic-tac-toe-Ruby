require_relative 'marker'

class Game
  attr_accessor :board, :game_over, :next_turn
  attr_reader :x_marker, :o_marker, :letter_index

  def initialize(args = {})
    @board = args.fetch(:board, [])
    @letter_index = %w(A B C D E F G H I J)
    @game_over = false
    @next_turn = ""
  end

  def start_game
    @letter_index = @letter_index[0..@board.board_output.length-1]
    @next_turn = ["player1", "player2"].sample
  end

  def game_over?
    if @game_over == false
      return
    end
  end

  def player2_move
    row = (0..(@board.board_output.length-1)).to_a.sample
    column = (0..(@board.board_output.length-1)).to_a.sample
    if @board.board_output[row][column] != nil
      player2_move
    else
      @board.board_output[row][column] = Marker.new(player: "player2", symbol: :❌)
    end
    @next_turn = "player1"
    print "Player 2 has gone!"
  end

  def player1_move
    valid_input = false

    puts "Enter Desired Square:"

    while valid_input == false
      square = gets.chomp.upcase.split(//)

      if (0..@board.board_output.length-1).to_a.include?(square[1].to_i) && @letter_index.include?(square[0])
        valid_input = true
      else
        puts "Invalid square, try again:"
      end
    end

    if @board.board_output[@letter_index.index(square[0])][square[1].to_i] != nil
      puts "This spot is already taken!"
      player1_move
    else
      @board.board_output[@letter_index.index(square[0])][square[1].to_i] = Marker.new(player: "player1", symbol: :⭕️)
    end

    @next_turn = "player2"
  end

end
