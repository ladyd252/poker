
class Deck
  attr_reader :cards

  SUITES = [:hearts, :clubs, :diamonds, :spades]
  VALUES = [:ace,:two,:three,:four,:five,:six,:seven,:eight,:nine,:ten,:jack,
    :queen,:king]


  def initialize
    @cards = create_cards
  end

  def size
    cards.size
  end

  def create_cards
    deck = []

    SUITES.each do |suite|
      VALUES.each do |value|
        deck << Card.new(suite,value)
      end
    end
    deck.shuffle
  end

  def take_card
    cards.pop
  end

end
