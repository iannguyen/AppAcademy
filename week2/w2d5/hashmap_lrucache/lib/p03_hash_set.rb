require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count >= num_buckets
      resize!
    end
    self[key] << key.hash
    @count += 1
  end

  def include?(key)
    self[key].include?(key.hash)
  end

  def remove(key)
    self[key].delete(key.hash)
  end

  private

  def [](num)
    mod = num.hash % num_buckets
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
