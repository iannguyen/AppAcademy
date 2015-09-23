require 'rspec'
require 'deck'

describe Deck do
  subject(:new_deck) { Deck.new }

  describe "#initialize" do

    it "should default to 52 cards (4 suits, 13 cards per suit)" do
      expect(new_deck.cards.count).to eq(52)
    end

  end

  describe "#shuffle" do

    it "shuffles the deck" do
      expect(Deck.new.shuffle).to_not eq(new_deck.cards)
    end

  end

  describe '#deal' do

    it "shifts the first card" do
      expect(new_deck.deal).to be_a(Card)

      expect(new_deck.cards.count).to eq(51)
    end
  end
end
