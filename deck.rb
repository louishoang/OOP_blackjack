class Deck
  attr_accessor: cards

  def initialize
    @cards = []
  suite = ['H', 'D', 'S', 'C']
  value = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

  @cards = value.product(suite)

  scramble
  end

  def scramble
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end
  
end

