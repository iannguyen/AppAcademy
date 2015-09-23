class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable

  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
  end

  def empty?
  end

  def get(key)
    maybe_node = find { |link| link.key == key }
    return maybe_node.val if maybe_node
  end

  def include?(key)
    # puts self[0]
    # p self[1].next
    any? {|node| node.key == key}
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    current_node = @head

    until current_node.next.nil?
      next_node = current_node.next
      current_node = next_node
    end
    current_node.next = new_link
  end

  def remove(key)
    idx = nil
    each_with_index { |link, i| idx = i if link.key == key }
    puts idx


    # idx = find_index {|link| link.key == key}
    # (self[idx - 1].next = self[idx + 2]) if idx
  end

  def each
    current_node = @head.next

    until current_node.nil?
      yield current_node
      current_node = current_node.next
    end
    # until self.next == nil
    #   yield(self)
    # end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
