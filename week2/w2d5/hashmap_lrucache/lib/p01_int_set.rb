class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true

  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num] if is_valid?(num)
  end

  private

  def is_valid?(num)
    (0..@max).include?(num)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
    true if num < @max
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    idx = num % 20
    @store[idx] << num
  end

  def remove(num)
    @store[num % 20].each_with_index do |el, idx|
      if el == num
        @store.delete_at(idx)
      end
    end

  end

  def include?(num)
    return true if @store[num % 20].any? { |x| x == num }
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20, count = 0)
    @store = Array.new(num_buckets) { Array.new }
    @count = count
  end

  def insert(num)
    # p @store[num]
    if @count >= num_buckets
      resize!
    end
      self[num] << num
      @count += 1
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    mod = num % num_buckets
    @store[mod]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store2 = Array.new(num_buckets * 2, num_buckets) { [] }
    @store.flatten.each do |el|
        @store2[el] << el 
    end
    @store2
  end
end
