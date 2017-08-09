module CheckDraw

  def self.check_draw(board)
    status = []
    board.each do |row|
      if row.include?(nil)
        status.push(true)
      else
        status.push(false)
      end
    end
    if status.include?(true)
      return false
    else
      return true
    end
  end
end
