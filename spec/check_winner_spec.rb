require_relative "../game"
require_relative "../marker"
require_relative "../board"
require_relative "../check_winner"
require "pry"

describe CheckWinner do
  let(:game1) {Game.new(board: Board.new(size: 3))}

  describe "rows colums diagonals check" do
    it "returns true if column is unique" do
      game_board = game1.board.board_output
      game_board[0][0] = game1.o_marker
      game_board[0][1] = game1.o_marker
      game_board[0][2] = game1.o_marker
      game_board[1][0] = game1.o_marker
      game_board[1][1] = game1.x_marker
      game_board[1][2] = game1.x_marker
      game_board[2][0] = game1.o_marker
      game_board[2][1] = game1.x_marker
      game_board[2][2] = game1.o_marker

      expect(CheckWinner.check_columns?(game_board)). to be(true)
      expect(CheckWinner.check_rows?(game_board)). to be(true)
      expect(CheckWinner.check_diag?(game_board)). to be(false)


    end
  end

  describe "winner check" do
    it "returns true if there is a winner" do
      game_board = game1.board.board_output
      game_board[0][0] = game1.o_marker
      game_board[0][1] = game1.o_marker
      game_board[0][2] = game1.o_marker
      game_board[1][0] = game1.o_marker
      game_board[1][1] = game1.x_marker
      game_board[1][2] = game1.x_marker
      game_board[2][0] = game1.o_marker
      game_board[2][1] = game1.x_marker
      game_board[2][2] = game1.o_marker

      expect(CheckWinner.board_check(game_board)). to be(true)

    end

    it "returns false if there is no winner" do
      game_board = game1.board.board_output
      game_board[0][0] = game1.x_marker
      game_board[0][1] = game1.o_marker
      game_board[0][2] = game1.o_marker
      game_board[1][0] = game1.o_marker
      game_board[1][1] = game1.x_marker
      game_board[1][2] = game1.x_marker
      game_board[2][0] = game1.o_marker
      game_board[2][1] = game1.x_marker
      game_board[2][2] = game1.o_marker

      expect(CheckWinner.board_check(game_board)). to be(false)

    end

  end

end
