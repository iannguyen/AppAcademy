require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    set_up_deck
  end

  def set_up_deck
    suits = [:heart, :spade, :diamond, :club]
    values = (2..14).to_a
    suits.each do |suit|
      values.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def shuffle
    cards.shuffle!
  end

  def deal
    cards.shift
  end


end

#remember to use symbols for suit
