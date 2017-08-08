
module View

  def self.board_display(board, board_size)
    system 'clear'
    board_index_size = board_size.to_i - 1
    board.each do |row|
      row.each_with_index do |square, index|
        if square != nil
          if index == board_index_size
            print "|  #{square.symbol}  |"
          else
            print "|  #{square.symbol}  "
          end
        else
          if index == board_index_size
            print "|     |"
          else
            print "|     "
          end
        end
      end
      print "\n"
    end
  end
end
