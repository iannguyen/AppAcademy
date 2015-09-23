require 'rspec'
require 'hand'

describe Hand do
  subject(:new_hand) { Hand.new }
  let(:hand_royal_flush) { Hand.new([Card.new(:heart, 10), Card.new(:heart, 11), Card.new(:heart, 12), Card.new(:heart, 13), Card.new(:heart, 14) ])  }
  let(:hand_straight_flush) { Hand.new([Card.new(:heart, 10), Card.new(:heart, 11), Card.new(:heart, 12), Card.new(:heart, 13), Card.new(:heart, 9) ])  }
  let(:hand_four) { Hand.new([Card.new(:heart, 10), Card.new(:spade, 10), Card.new(:club, 10), Card.new(:diamond, 10), Card.new(:heart, 14) ])  }
  let(:hand_full_house) { Hand.new([Card.new(:heart, 10), Card.new(:spade, 10), Card.new(:diamond, 10), Card.new(:heart, 13), Card.new(:club, 13) ])  }
  let(:hand_flush) { Hand.new([Card.new(:heart, 10), Card.new(:heart, 2), Card.new(:heart, 6), Card.new(:heart, 13), Card.new(:heart, 7) ])  }
  let(:hand_straight) { Hand.new([Card.new(:heart, 10), Card.new(:spade, 11), Card.new(:club, 12), Card.new(:diamond, 13), Card.new(:club, 14) ])  }
  let(:hand_three) { Hand.new([Card.new(:heart, 10), Card.new(:club, 10), Card.new(:diamond, 10), Card.new(:heart, 13), Card.new(:heart, 14) ])  }
  let(:hand_two_pair) { Hand.new([Card.new(:heart, 10), Card.new(:club, 10), Card.new(:diamond, 12), Card.new(:spade, 12), Card.new(:heart, 14) ])  }
  let(:hand_pair) { Hand.new([Card.new(:heart, 10), Card.new(:diamond, 10), Card.new(:spade, 12), Card.new(:club, 13), Card.new(:heart, 14) ])  }
  let(:hand_random) { Hand.new([Card.new(:club, 2), Card.new(:heart, 5), Card.new(:spade, 12), Card.new(:heart, 7), Card.new(:heart, 11) ])  }

  describe "#initialize" do
    it "initializes with an empty array of cards" do
      expect(Hand.new.cards).to be_empty
    end
  end


  describe '#royal_flush?' do
    context 'the hand is a royal flush' do
      it 'returns true' do
        expect(hand_royal_flush.royal_flush?).to be true
        expect(hand_royal_flush).to be_royal_flush
      end
    end

    context 'the hand is random, not a royal flush' do
      it 'returns false' do
        expect(hand_random.royal_flush?).to be false
      end
    end
  end #ends royal flush

  describe '#straight_flush?' do
    context 'the hand is a straight flush' do
      it 'returns highest value of straight' do
        expect(hand_straight_flush.straight_flush?).to be_truthy
        expect(hand_straight_flush.straight_flush?).to eq(13)
      end
    end

    context 'the hand is random, not a straight flush' do
      it 'returns false' do
        expect(hand_random.straight_flush?).to be false
      end
    end
  end

  describe '#four_of_a_kind?' do
    context 'the hand is a four of a kind' do
      it 'returns highest value of four_of_a_kind' do
        expect(hand_four.four_of_a_kind?).to be_truthy
        expect(hand_four.four_of_a_kind?).to eq(10)
      end
    end

    context 'the hand is random, not a four of a kind' do
      it 'returns false' do
        expect(hand_random.four_of_a_kind?).to be false
      end
    end
  end

  describe '#full_house?' do
    context 'the hand is a full house' do
      it 'returns highest value of full house three of a kind' do
        expect(hand_full_house.full_house?).to be_truthy
        expect(hand_full_house.full_house?).to eq(10)
      end
    end

    context 'the hand is random, not a full house' do
      it 'returns false' do
        expect(hand_random.full_house?).to be false
      end
    end
  end

  describe '#flush?' do
    context 'the hand is a flush' do
      it 'returns highest value of flush' do
        expect(hand_flush.flush?).to be_truthy
        expect(hand_flush.flush?).to eq(13)
      end
    end

    context 'the hand is random, not a flush' do
      it 'returns false' do
        expect(hand_random.flush?).to be false
      end
    end
  end

  describe '#evaluate' do
    it 'returns the rank of the hand' do
      expect(hand_full_house.evaluate).to eq(:full_house?)
    end
  end

  describe '#beats' do
    context 'my royal flush beats the other hand four of a kind' do
      it 'returns true' do
        expect(hand_royal_flush.beats(hand_four)).to be true
      end
    end

    context 'my full house loses to the other hand four of a kind' do
      it 'returns false' do
        expect(hand_full_house.beats(hand_four)).to be false
      end
    end
  end


  # context "high card is the best hand"
  # it "identifies a high card" do
  # end
  #
  # it "identifies a pair" do
  # end
  #
  #
  # end
  #
  #
  # high card
  # pair
  # two pair
  # three of a kind
  # straight
  # flush
  # full house
  # four of a kind
  # straight flush
  # royal flush
  #




end
