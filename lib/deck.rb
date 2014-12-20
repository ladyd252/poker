require_relative 'card.rb'

class Deck
  attr_reader :cards

  def initialize
    @cards = create_cards
  end

  def size
    cards.size
  end

  def create_cards
    deck = []

    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        deck << Card.new(suit, value)
      end
    end
    deck.shuffle
  end

  def take_card
    cards.pop
  end

end
