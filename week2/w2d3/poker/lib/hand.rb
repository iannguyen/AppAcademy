require_relative 'deck'
require_relative 'card'

class Hand

  attr_accessor :cards

  def initialize(hand = [])
    @cards = hand
  end
  #check hand for moves

  def evaluate
    winning_methods = [method(:royal_flush?), method(:straight_flush?), method(:four_of_a_kind?),method(:full_house?)]

    winning_methods.find { |m| m.call}.name
  end

  def royal_flush?
    expected_values = (10..14).to_a
    expected_suit = cards[0].suit

    cards.all? do |card|
      expected_values.include?(card.value) &&
      card.suit == expected_suit
      end
  end

  def straight_flush?
    expected_suit = cards[0].suit
    @cards = @cards.sort_by { |card| card.value }

    cards.each_with_index do |card, idx|
      return false unless card.value == cards[0].value + idx
      return false unless card.suit == expected_suit
    end
    cards.last.value
  end

  def four_of_a_kind?
    counts = Hash.new(0)

    cards.each do |card|
      counts[card.value] += 1
    end

    counts = counts.select { |card, value| value == 4 }
    return false if counts.empty?
    counts.each { |card, value| return card }
  end

  def full_house?
    counts = Hash.new(0)

    cards.each do |card|
      counts[card.value] += 1
    end

    if counts.values.include?(2) && counts.values.include?(3)
      counts = counts.sort_by { |key, value| value }.to_h
      return counts.keys.last
    end
    return false
  end

  def flush?
    expected_suit = cards[0].suit

    if cards.all? { |card| card.suit == expected_suit }
      return cards.sort_by { |card| card.value }.last.value
    end
    false
  end

  def beats(other_hand)
    my_hand = self.evaluate
    other_player = other_hand.evaluate

    winning_methods = [:royal_flush?, :straight_flush?, :four_of_a_kind?,:full_house?]

    winning_methods.index(my_hand) < winning_methods.index(other_player)
  end

end #end of class
