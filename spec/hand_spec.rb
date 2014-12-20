require 'hand'
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
    let(:cards) { [1, 2, 3, 4, 5] }

    it "initializes to 5 cards" do
      my_hand =  Hand.new(cards)
      expect(my_hand.cards.size).to eq(5)
      expect(my_hand.cards).to match_array([1,3,2,4,5])
    end
  end

  describe "Hand#beats?" do

    it "returns true for a four of a kind again full house" do
      my_hand = Hands.new(four_kind)
      other_hand = Hands.new(full_house)
      expect(my_hand.beats?(other_hand)).to eq(true)
    end
  end

  describe "Hand#four_kind?" do
    it "returns true for a four of a kind" do
      hand = Hand.new(four_kind)
      expect(hand.four_kind?).to eq(true)
    end

    it "returns false for a full house" do
      hand = Hand.new(full_house)
      expect(hand.four_kind?).to eq(false)
    end
  end

  describe "Hand#full_house?" do
    it "returns true for a full_house" do
      hand = Hand.new(full_house)
      expect(hand.full_house?).to eq(true)
    end

    it "returns false for a four of a kind" do
      hand = Hand.new(four_kind)
      expect(hand.full_house?).to eq(false)
    end
  end

  describe "Hand#straight?" do
    it "returns true for a straight" do
      hand1 = Hand.new(straight_no_ace)
      hand2 = Hand.new(straight_start_ace)
      hand3 = Hand.new(straight_end_ace)
      hand4 = Hand.new(full_house)
      expect(hand1.straight?).to eq(true)
      expect(hand2.straight?).to eq(true)
      expect(hand3.straight?).to eq(true)
      expect(hand4.straight?).to eq(false)
    end
  end
end
