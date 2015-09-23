require 'rspec'
require 'card'

describe Card do

  describe "#initialize" do
    let(:card) { Card.new(:spade, 2) }
      it "has a suit" do
        expect(card.suit).to be(:spade)
      end

      it "has a value" do
        expect(card.value).to be(2)
      end
    end

end
