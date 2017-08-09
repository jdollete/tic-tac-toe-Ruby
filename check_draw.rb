module CheckDraw

  def self.check_draw(board)
    status = board.map do |row|

      if row.include?(nil)
        true
      else
        false
      end

    end

    if status.include?(true)
      return false
    else
      return true
    end

  end

end
