class Marker
  attr_reader :player, :symbol

  def initialize(args = {})
    @player = args.fetch(:player, "")
    @symbol = args.fetch(:symbol, "")
  end

end
