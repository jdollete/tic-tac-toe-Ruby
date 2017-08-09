require_relative "../game"
require_relative "../marker"
require_relative "../board"

describe Game do
  let(:game1) {Game.new(board: Board.new(size: 4))}

  describe "creates new game" do
    it "is an object" do
      expect(game1).to be_a_kind_of(Object)
    end

    it "has a board size of 4" do
      expect(game1.board.board_output.length).to be(4)
    end
  end

end
