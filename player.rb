class Player
  include Hand
  attr_accessor :name, :cards

  def initialize
    @name = n
    @cards = []
  end

  def show_flop
    show_hand
  end
end