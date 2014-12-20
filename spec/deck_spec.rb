require 'deck'
require 'rspec'

describe "Deck" do
  describe "Deck#initialize" do
    it "initializes the deck to 52 cards" do
      my_deck = Deck.new
      expect(my_deck.size).to eq(52)
    end

    it "shuffles" do
      my_deck1 = Deck.new
      my_deck2 = Deck.new
      expect(my_deck1.cards).to_not eq(my_deck2.cards)
    end
  end

  describe "Deck#take_card" do
    it "deals the last card in the deck" do
      my_deck = Deck.new
      last_card = my_deck.cards.last
      my_deck_size = my_deck.size
      expect(my_deck.take_card).to eq (last_card)
      expect(my_deck.size).to eq (my_deck_size-1)
    end
  end

end
