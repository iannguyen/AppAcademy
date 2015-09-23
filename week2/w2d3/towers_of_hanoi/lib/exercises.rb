class Array

  def my_uniq
    uniques = []
    self.each do |el|
      uniques << el unless uniques.include?(el)
    end
    uniques
  end

  def two_sum
    sum_pairs = []

    self.each_with_index do |item, idx|
      ((idx + 1)...self.length).each do |index2|
        if self[idx] + self[index2] == 0
          sum_pairs << [idx, index2]
        end
      end
    end

    sum_pairs
  end

end

def my_transpose(matrix)
  transposed = Array.new(matrix.length) { [] }

  matrix.each do |row|
    row.each_with_index do |el, idx|
      transposed[idx] << el
    end
  end

  transposed
end

def stock_picker(stocks)
  days = []
  idx1 = 0
  greatest_profit = nil
  (stocks.length-1).times do |idx1|
    ((idx1+1)...stocks.length).each do |idx2|
      difference = stocks[idx2] - stocks[idx1]
      if greatest_profit.nil? || difference > greatest_profit
        greatest_profit = difference
        days = [idx1, idx2]
      end
    end
  end
  days
end

# while idx1 < stocks.length-1
#   idx2 = idx1 + 1
#   while idx2 < stocks.length
#     difference = stocks[idx2] - stocks[idx1]
#     if greatest_profit.nil? || difference > greatest_profit
#       greatest_profit = difference
#       days = [idx1, idx2]
#     end
#     idx2 += 1
#   end
#   idx1 += 1
# end
