module CheckWinner

  def self.board_check(board)
    rows = check_rows?(board)
    columns = check_columns?(board)
    diagonals = check_diag?(board)
    if rows == true || columns == true || diagonals == true
      return true
    else
      return false
    end
  end

  def self.check_columns?(board)
    straight_match = false
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
        straight_match = true
      end
    end
    return straight_match
  end

  def self.check_rows?(board)
    straight_match = false
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
        straight_match = true
      end
    end
    return straight_match
  end

  def self.check_diag?(board)
    shifted_board = board.map.with_index { |row, i| row.rotate(i) + row.rotate(-i) }.transpose

    if shifted_board.first.include?(nil) && shifted_board.last.include?(nil)
      return false
    elsif shifted_board.first.include?(nil)
      diag_right = check_match?(shifted_board.last)
    elsif shifted_board.last.include?(nil)
      diag_left = check_match?(shifted_board.first)
    end

    if diag_left == true || diag_right == true
      return true
    else
      return false
    end
  end

  def self.check_match?(element)
    diag_symbols = []
    element.each do |square|
      diag_symbols.push(square.symbol)
    end

    if diag_symbols.uniq.length == 1
      return true
    end

    return false
  end

end
