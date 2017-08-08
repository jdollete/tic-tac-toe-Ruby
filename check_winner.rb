module CheckWinner

  def self.board_check
    check_rows
    check_columns
    check_diag
  end

  def self.check_rows
    puts "Rows Checked"
  end

  def self.check_columns
    puts "Columns Checked"
  end

  def self.check_diag
    puts "Diagonals Checked"
  end

end
