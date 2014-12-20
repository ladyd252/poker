class Player
  attr_read :hand, :name

  def initialize(hand, name, pot = 100)
    @hand = hand
    @name = name
    @pot = pot
  end

  def cards_to_discard
    #hand.display
    discard_pile = []
    done = false
    until done
      puts "Which card would you like to discard? Enter x to stop"
      response = get.chomp
      unless response == 'x'
        discard_pile << response.to_i
      else
        done = true
      end
    end
    discard_pile
  end

  def next_move
    done = false
    until done
      puts "What would you like to do? f => fold, s => see, r => raise"
      response = get.chomp
      done = true if ["f", "s", "r"].include?(response)
    end
    response.to_sym
  end

end
