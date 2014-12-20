class Hand
  attr_reader :cards


  def initialize(cards)
    @cards = cards

  end

  def <=>(other_hand)

    if hand_value > other_hand.hand_value
      1
    elsif hand_value == other_hand.hand_value
      win_tie_breaker(other_hand)
    else
      -1
    end
  end

  def hand_value
    if royal_flush?
      10
    elsif straight_flush?
      9
    elsif four_kind?
      8
    elsif full_house?
      7
    elsif flush?
      6
    elsif straight?
      5
    elsif three_kind?
      4
    elsif two_pair?
      3
    elsif one_pair?
      2
    else
      1
    end
  end


  private

  def win_tie_breaker(other_hand)
    0
    # case hand_value
    # when 10
    #   0
    # when 9
    #   card_values.sort.last <=> other_hand.card_values.sort.last
    # when 8
    # end
  end





  def card_values
    card_vals = []
    cards.each do |card|
      card_vals << card.num_val
    end
    card_vals
  end

  def royal_flush?
    if flush?
      royals = [:ten,:jack,:queen,:king,:ace]
      royals.all? {|royal| contains_val?(royal)}
    else
      false
    end
  end

  def straight_flush?
    straight? && flush?
  end

  def straight?
    card_vals = card_values.sort
    if card_vals.last == 13 && card_vals.first == 1
      card_vals.shift
    end

    (0...card_vals.length-1).each do |i|
      unless card_vals[i] + 1 == card_vals[i + 1]
        return false
      end
    end
    true
  end

  def four_kind?
    dups = dup_vals
    dups.each do |key, val|
      return true if val == 4
    end
    false
  end

  def three_kind?
    dups = dup_vals
    dups.each do |key, val|
      return true if val == 3
    end
    false
  end

  def two_pair?
    num_pairs = 0
    dups = dup_vals
    dups.each do |key, val|
      num_pairs += 1 if val == 2
    end

    num_pairs == 2
  end

  def pair?
    dups = dup_vals
    dups.each do |key, val|
      return true if val == 2
    end
    false
  end

  def full_house?
    three_kind? && pair?
  end


  def dup_vals
    dups = Hash.new(0)
    cards.each do |card|
      dups[card.value] += 1
    end
    dups
  end

  def flush?
    same_suit?
  end

  def cotains_suit?(suit)
    cards.each do |card|
      return true if card.suit == suit
    end
    false
  end

  def contains_val?(val)
    cards.each do |card|
      return true if card.value == val
    end
    false
  end

  def same_suit?
    suit = cards.first.suit
    cards.all? { |card| card.suit == suit }
  end



end
