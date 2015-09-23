require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  let(:fake_stack) {[[3, 2], [1], []] }

  describe "#initialize" do
    it "creates a default stack" do
      expect(game.stack).to eq([[3, 2, 1], [], []])
    end

    it "accepts a stack as an argument" do
      expect(TowersOfHanoi.new(fake_stack).stack).to be(fake_stack)
    end
  end

  describe "#move" do
    it "pops from populated stack" do
      game.move(0, 1)
      expect(game.stack).to eq(fake_stack)
    end

    it "doesn't allow bigger piece to go onto smaller piece" do
      game = TowersOfHanoi.new(fake_stack)
      expect { game.move(0, 1) }.to raise_error("Invalid Move")
    end
  end

  describe "#game_over?" do
    let(:completed_stack) { [[], [3, 2, 1], []] }
    context "first stack is empty and all discs are in either stack 2 or 3" do
      it "returns true" do
        expect(TowersOfHanoi.new(completed_stack).game_over?).to be true
      end
    end

      context "first stack has disks or disks are not in one stack" do
        it "return false" do
          expect(game.game_over?).to be false
        end
      end
    end
end
