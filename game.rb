class Game
  attr_accessor :board
  attr_reader :x_marker, :o_marker

  def initialize(args = {})
    @board = args.fetch(:board, [])
    @game_over = false
  end

end
