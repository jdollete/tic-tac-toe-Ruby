
module View

  def self.board_display(board, board_size)
    system 'clear'
    letters = %w(A B C D E F G H I J)
    letter_index = 0
    top_label = ""
    divider = ""
    label_number = 0

    board_size.to_i.times do
      top_label << "   #{label_number}  "
      divider << "------"
      label_number += 1
    end

    top_label << "\n"
    divider << "\n"
    print top_label
    print divider
    board_index_size = board_size.to_i - 1

    board.each do |row|
      row.each_with_index do |square, index|

        if square != nil
          if index == board_index_size
            print "|  #{square.symbol}  |  #{letters[letter_index]}"
            letter_index += 1
          else
            print "|  #{square.symbol}  "
          end

        else
          if index == board_index_size
            print "|     |  #{letters[letter_index]}"
            letter_index += 1
          else
            print "|     "
          end

        end

      end

      print "\n"
      print divider
      
    end
  end
end
