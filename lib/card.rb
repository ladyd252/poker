class Card
  attr_reader :suite, :value
  def initialize(suite, value)
    @suite = suite
    @value = value
  end

  def num_val
    val_hash = {:ace => 1,
                :two => 2,
                :three => 3,
                :four => 4,
                :five => 5,
                :six => 6,
                :seven => 7,
                :eight => 8,
                :nine => 9,
                :ten => 10,
                :jack => 11,
                :queen => 12,
                :king => 13
                }
    val_hash[value]
  end
end
