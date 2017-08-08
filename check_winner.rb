module CheckWinner

  def self.board_check(board)
    rows = check_rows(board)
    columns = check_columns(board)
    check_diag(board)
    if rows == true || columns == true
      return true
    else
      return false
    end
  end

  def self.check_columns(board)
    straigh_match = false
    board.each do |column|
      column_symbols = []
      column.each do |square|
        if square != nil
          column_symbols.push(square.symbol)
        else
          column_symbols.push(square)
        end
      end
      if column_symbols.uniq.length == 1 && column_symbols.include?(nil) == false && column_symbols.length == column.length
        straigh_match = true
      end
    end
    return straigh_match
  end

  def self.check_rows(board)
    straigh_match = false
    board.transpose.each do |row|
      row_symbols = []
      row.each do |square|
        if square != nil
          row_symbols.push(square.symbol)
        else
          row_symbols.push(square)
        end
      end
      if row_symbols.uniq.length == 1 && row_symbols.include?(nil) == false && row_symbols.length == row.length
        straigh_match = true
      end
    end
    return straigh_match
  end

  def self.check_diag(board)
    puts "Diagonals Checked"
  end

end
