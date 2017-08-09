require_relative "../marker"

describe Marker do
  let(:marker) { Marker.new(player: "player1", symbol: :⭕️)}

  describe "Creates new player 1 marker" do
    it "is an object" do
      expect(marker).to be_a_kind_of(Object)
    end

    it "has a symbol for player 1" do
      expect(marker.symbol).to be(:⭕️)
    end
  end
end
