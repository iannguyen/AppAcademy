require 'rspec'
require 'exercises'

describe "#my_uniq" do
  let(:array) { [1,2,1,3,3] }

  it "removes duplicates from an array" do
    expect(array.my_uniq).to eq(array.uniq)
  end

  it "deals with an empty array" do
    expect([].my_uniq).to eq([])
  end

end

describe "#two_sum" do
  let(:array1) { [-1,0,2,-2] }
  let(:array2) { [-1,0,2,-2,1] }

  it "finds the positions of two elements of sum 0" do
    expect(array1.two_sum).to eq([[2,3]])
  end

  it "returns the positions of two elements of sum 0, from smallest to largest" do
    expect(array2.two_sum).to eq([[0,4], [2,3]])
  end

  it "deals with an empty array" do
    expect([].two_sum).to eq([])
  end

  it "deals with an array with no matches" do
    expect([1,2,3].two_sum).to eq([])
  end
end

describe "#my_transpose" do
  let(:matrix1) { [[0,1,2],[3,4,5],[6,7,8]] }

  context "is given an empty array" do
    it "returns an empty array" do
      expect(my_transpose([])).to eq([])
    end
  end

  it "transposes a square matrix" do
    expect(my_transpose(matrix1)).to eq(matrix1.transpose)
  end
end

describe "#stock_picker" do
  let(:stocks) { [ 4, 5, 1, 6, 4] } #answer should be [2, 3]
  let(:bad_days) { [ 5, 4, 3, 2, 1] }

  it "deals with an empty array" do
    expect(stock_picker([])).to eq([])
  end

  it "gives the correct pair for stock profits" do
    expect(stock_picker(stocks)).to eq([2,3])
  end

  it "gives the least unprofitable day when there are no profitable days" do
    expect(stock_picker(bad_days)).to eq([0,1])
  end
end


#stay
