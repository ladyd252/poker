require "card.rb"
require "rspec"

describe Card do
  describe "Card#value" do
    it "returns the card's value" do
      card = Card.new(:hearts, :three)
      expect(card.value).to eq(:three)
    end
  end

  describe "Card#suite" do
    it "returns the card's suite" do
      card = Card.new(:hearts, :three)
      expect(card.suite).to eq(:hearts)
    end
  end
end
