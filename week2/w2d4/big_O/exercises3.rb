require_relative 'stacks.rb'
def max_windowed_range(arr, window_size)
  best_max = nil
  arr.each_with_index do |el, idx|
    current_window = arr[idx...(idx + window_size)]
    current_max = current_window.max - current_window.min
    if best_max.nil? || current_max > best_max
      best_max = current_max
    end
  end
  best_max
end

# O(n**2) quadratic

def optimized_window_whatever(arr, window_size)
  max = nil
  stack = StackQueue.new
  until stack.size == window_size
    stack.enqueue(arr.shift)
  end
  max = stack.max - stack.min
  until arr.empty?
    stack.enqueue(arr.shift)
    stack.dequeue
    current_max = stack.max - stack.min
    if current_max > max
      max = current_max
    end
  end
  max

end

# O(n) linear
