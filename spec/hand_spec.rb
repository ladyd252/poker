require 'hand'
require 'card'
require 'rspec'

describe "Hand" do

  let(:four_kind) {
    cards = []
    cards << Card.new(:hearts, :ace)
    cards << Card.new(:spades, :ace)
    cards << Card.new(:diamonds, :ace)
    cards << Card.new(:clubs, :ace)
    cards << Card.new(:hearts, :three)
    cards
  }
  let(:full_house){
    cards = []
    cards << Card.new(:hearts, :five)
    cards << Card.new(:spades, :five)
    cards << Card.new(:diamonds, :five)
    cards << Card.new(:hearts, :six)
    cards << Card.new(:spades, :six)
    cards
  }

  let(:straight_no_ace){
    cards = []
    cards << Card.new(:hearts, :five)
    cards << Card.new(:spades, :six)
    cards << Card.new(:diamonds, :seven)
    cards << Card.new(:hearts, :eight)
    cards << Card.new(:spades, :nine)
    cards
  }

  let(:straight_start_ace){
    cards = []
    cards << Card.new(:hearts, :ace)
    cards << Card.new(:spades, :two)
    cards << Card.new(:diamonds, :three)
    cards << Card.new(:hearts, :four)
    cards << Card.new(:spades, :five)
    cards
  }

  let(:straight_end_ace){
    cards = []
    cards << Card.new(:hearts, :ace)
    cards << Card.new(:spades, :king)
    cards << Card.new(:diamonds, :queen)
    cards << Card.new(:hearts, :jack)
    cards << Card.new(:spades, :ten)
    cards
  }

  describe "Hand#initialize" do
    let(:cards) { four_kind }

    it "initializes to 5 cards" do
      my_hand =  Hand.new(cards)
      expect(my_hand.cards.size).to eq(5)
      expect(my_hand.cards).to match_array(four_kind)
    end
  end

  describe "Hand#<=>" do
    it "returns 1 for a four of a kind again full house" do
      four_kind_hand = Hand.new(four_kind)
      full_house_hand = Hand.new(full_house)
      expect(four_kind_hand <=> full_house_hand).to eq(1)
    end

    it "returns -1 for a straight against full house" do
      my_hand = Hand.new(straight_no_ace)
      other_hand = Hand.new(full_house)
      expect(my_hand <=> other_hand).to eq(-1)
    end

    it "returns 0 for a straight against straight" do
      my_hand = Hand.new(straight_no_ace)
      other_hand = Hand.new(straight_start_ace)
      expect(my_hand <=> other_hand).to eq(0)
    end

  end

end
