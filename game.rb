require_relative 'marker'

class Game
  attr_accessor :board, :game_over, :next_turn
  attr_reader :x_marker, :o_marker, :letter_index

  def initialize(args = {})
    @board = args.fetch(:board, [])
    @letter_index = %w(A B C D E F G H I J)
    @x_marker = Marker.new(player: "player2", symbol: :❌)
    @o_marker = Marker.new(player: "player1", symbol: :⭕️)
    @game_over = false
    @next_turn = ""
  end

  def start_game
    @letter_index = @letter_index[0..@board.board_output.length-1]
    @next_turn = ["player1", "player2"].sample
  end

  def player2_move
    row = (0..(@board.board_output.length-1)).to_a.sample
    column = (0..(@board.board_output.length-1)).to_a.sample

    if @board.board_output[row][column] != nil
      player2_move
    else
      @board.board_output[row][column] = @x_marker
    end

    @next_turn = "player1"
  end

  def player1_move
    valid_input = false

    puts "Enter Desired Square Location:"

    while valid_input == false
      square = gets.chomp.upcase.split(//)
      valid_number = (0..@board.board_output.length-1).to_a.include?(square[1].to_i)
      valid_letter = @letter_index.include?(square[0])


      if valid_number && valid_letter
        valid_input = true
      else
        puts "Invalid square, try again:"
      end

    end

    available_square = @board.board_output[@letter_index.index(square[0])][square[1].to_i] != nil
    
    if available_square
      puts "This spot is already taken!"
      player1_move
    else
      @board.board_output[@letter_index.index(square[0])][square[1].to_i] = @o_marker
    end

    @next_turn = "player2"
  end

end
