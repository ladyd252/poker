require "card.rb"
require "rspec"

describe Card do
  describe "Card#value" do
    it "returns the card's value" do
      card = Card.new(:hearts, :three)
      expect(card.value).to eq(:three)
    end
  end

  describe "Card#suit" do
    it "returns the card's suit" do
      card = Card.new(:hearts, :three)
      expect(card.suit).to eq(:hearts)
    end
  end
end
