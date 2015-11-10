class Hand
  attr_reader :cards
  
  ORDER = ["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"]

  def initialize(cards)
    @cards = cards
  end

  def high_card
    ORDER.detect { |c| ranks.include?(c) }
  end

  def type
    if straight_flush
      "straight flush"
    elsif four_kind
      "four of a kind"
    elsif fullhouse
      "fullhouse"
    elsif flush
      "flush"
    elsif straight
      "straight"
    elsif three_kind
      "three of a kind"
    elsif two_pair
      "two pair"
    elsif pair
      "pair"
    else
      "flop"
    end
  end

  private

  attr_reader :ranks, :suits
  
  def ranks
    @ranks ||= @cards.map { |c| c[0] }
  end

  def suits
    @suits ||= @cards.map { |c| c[1] }
  end

  def find_matching_ranks(amt)
    ranks.select { |r| ranks.count(r) == amt }
  end

  def pair
    find_matching_ranks(2) if find_matching_ranks(2).length == 2
  end

  def two_pair
    find_matching_ranks(2) if find_matching_ranks(2).length == 4
  end

  def three_kind
    find_matching_ranks(3) unless find_matching_ranks(3).empty?
  end

  def straight
    beg = ORDER.find_index(high_card) 
    final = beg + 4
    ORDER[beg..final].sort == ranks.sort
  end
  
  def flush
    suits.all? { |c| c == suits.first }
  end
  
  def fullhouse
    three_kind && pair
  end

  def four_kind
    find_matching_ranks(4) unless find_matching_ranks(4).empty?
  end
  
  def straight_flush
    straight && flush
  end
end
