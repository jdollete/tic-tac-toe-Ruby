require 'pry'

class Board
  attr_reader :board_output

  def initialize(args = {})
    @size = args.fetch(:size)
    @board_output = Array.new(@size) { Array.new(@size)}
  end

end
