class MyStack
  attr_reader :store, :max_stack
  def initialize
    @store = []
    @max = nil
    @min = nil
    @max_stack = []
    @min_stack = []
  end

  def pop
    popped = @store.pop
    if popped == @max_stack.last
      @max_stack.pop
    end
    if popped == @min_stack.last
      @min_stack.pop
    end
    popped
  end

  def max
    @max_stack.last
  end

  def min
    @min_stack.last
  end

  def push(el)
    @store.push(el)
    if @max_stack.last == nil || el > @max_stack.last
      @max_stack.push(el)
    end
    if @min_stack.last == nil || el < @min_stack.last
      @min_stack.push(el)
    end
    @store
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end
end


class StackQueue
  def initialize
    @enqueue = MyStack.new
    @dequeue = MyStack.new
  end

  def enqueue(el)
    @enqueue.push(el)
  end

  def dequeue
    if @dequeue.size.zero?
      until @enqueue.size.zero?
        @dequeue.push(@enqueue.pop)
      end
    end
    @dequeue.pop
  end

  def max
    if @dequeue.size.zero?
      @enqueue.max
    elsif @enqueue.size.zero?
      @dequeue.max
    elsif @enqueue.max >= @dequeue.max
      @enqueue.max
    else
      @dequeue.max
    end
  end

  def min
    if @dequeue.size.zero?
      @enqueue.min
    elsif @enqueue.size.zero?
      @dequeue.min
    elsif @enqueue.min <= @dequeue.min
      @enqueue.min
    else
      @dequeue.min
    end
  end

  def peek
    @dequeue.peek
  end

  def size
    @enqueue.size + @dequeue.size
  end
end
