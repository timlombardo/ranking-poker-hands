require "spec_helper"
require "hand"

describe Hand do
  let(:hand) { Hand.new(["2S","8D","3S","4S","5S"]) }

  describe "#new" do
    context "with a string parameter" do
      it "returns array of cards" do
        expect(hand.cards).to eq ["2S","8D","3S","4S","5S"]
      end
    end

    context "with an array parameter" do
    end
  end
  
  describe "#high_card" do
    it "returns the high card" do
      hand = Hand.new("2S 2D 3S 4S AS")
      expect(hand.high_card).to eq "A"
    end
  end

  describe "#type" do
    context "when it is a flop" do
      it "returns 'flop'" do
        expect(hand.type).to eq "flop"
      end
    end
    
    context "when it is a pair" do
      it "returns 'pair'" do
        hand = Hand.new("2S 2D 3S 4S 5S")
        expect(hand.type).to eq "pair"
      end
    end
    
    context "when it is two pair" do
      it "returns 'two pair'" do
        hand = Hand.new("2S 2D QS QD 5S")
        expect(hand.type).to eq "two pair"
      end
    end

    context "when it is three of a kind" do
      it "returns 'three of a kind'" do
        hand = Hand.new("3S 3D 3C 4D 5D")
        expect(hand.type).to eq "three of a kind"
      end
    end

    context "when it is a straight" do
      it "returns 'straight'" do
        hand = Hand.new("8S 9D TC JS QD")
        expect(hand.type).to eq "straight"
      end
    end
      
    context "when it is a flush" do
      it "returns 'flush'" do
        hand = Hand.new("3S 5S 7S 9S JS")
        expect(hand.type).to eq "flush"
      end
    end

    context "when it is a fullhouse" do
      it "returns 'fullhouse'" do
        hand = Hand.new("KS KD KC TS TD")
        expect(hand.type).to eq "fullhouse"
      end
    end

    context "when it is four of a kind" do
      it "returns 'four of a kind'" do
        hand = Hand.new("AS AD AC AH KS")
        expect(hand.type).to eq "four of a kind"
      end
    end

    context "when it is a straight flush" do
      it "returns 'straight flush'" do
        hand = Hand.new("TS JS QS KS AS")
        expect(hand.type).to eq "straight flush"
      end
    end
  end
end
