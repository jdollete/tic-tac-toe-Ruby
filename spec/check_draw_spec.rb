require_relative "../game"
require_relative "../marker"
require_relative "../board"
require_relative "../check_draw"
require "pry"

describe CheckDraw do
  let(:game1) {Game.new(board: Board.new(size: 3))}

  describe "check if there is a draw" do
    it "returns true no straight matches" do
      game_board = game1.board.board_output
      game_board[0][0] = game1.o_marker
      game_board[0][1] = game1.o_marker
      game_board[0][2] = game1.x_marker
      game_board[1][0] = game1.x_marker
      game_board[1][1] = game1.x_marker
      game_board[1][2] = game1.o_marker
      game_board[2][0] = game1.o_marker
      game_board[2][1] = game1.x_marker
      game_board[2][2] = game1.o_marker

      expect(CheckDraw.check_draw(game_board)).to be(true)

    end
  end
end
