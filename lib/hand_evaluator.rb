require "hand"

class HandEvaluator
  def return_stronger_hand(left, right)
    left = Hand.new(left)
    right = Hand.new(right)

    if left.type == "flop"
      if right.type =="flop"
        "tie"
      else
        left.cards.to_str
      end
    end
  end
end
