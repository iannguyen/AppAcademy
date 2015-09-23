require 'byebug'

def range_iterative(start_num, end_num)
  return [] if end_num < start_num
  (start_num..end_num).to_a
end

def range_recursive(start_num, end_num)
  return [] if end_num < start_num
  [start_num] + range_recursive(start_num + 1, end_num)
end

def power_to(base, num)
  return 1 if num.zero?
  base * power_to(base, num - 1)
end

def power_dc(base, num)
  return 1 if num.zero?
  if num.even?
    even_formula = power_dc(base, num / 2)
    even_formula * even_formula
  else
    odd_formula = (power_dc(base, (num - 1) / 2))
    base * odd_formula * odd_formula
  end
end

def deep_dup(array)
  duplicate = []
  array.each do |el|
    el.is_a?(Array) ? duplicate << deep_dup(el) : duplicate << el
  end
  duplicate
end

def fib(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  fibs = fib(n - 1)
  fibs << fibs[-1] + fibs[-2]
end

def bsearch(array, target)
  mid = array.length / 2
  return mid if array[mid] == target
  return nil if array[mid] != target && array.length == 1

  left = array.take(mid)
  right = array.drop(mid)

  if target > array[mid]
    mid + bsearch(right, target)
  elsif target < array[mid]
    mid -= 1
    mid + besearch(left, target)
  end
end

def change(dollar, coins)
  current_best = []
  return current_best if dollar == 0 || coins.empty?
  coins.sort!.reverse!
  largest_coin = coins.first
  remaining_amount = dollar

  if largest_coin <= dollar
    remaining_amount = dollar - largest_coin
    current_best << largest_coin
  else
    coins.shift
  end

  current_best += change(remaining_amount, coins)
end

def make_change(dollar, coins)
  best = []
  (coins.length).times do |idx|
    current_change = change(dollar, coins[idx..-1])
    if (current_change).length < best.length || best.empty?
      best = current_change
    end
  end

  best
end

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left_arr = arr.take(mid)
  right_arr = arr.drop(mid)
  merge(merge_sort(left_arr), merge_sort(right_arr))
end

def merge(left_arr, right_arr)
  merged = []
  until left_arr.empty? || right_arr.empty?
    if left_arr.first < right_arr.first
      merged << left_arr.shift
    elsif right_arr.first < left_arr.first
      merged << right_arr.shift
    end
  end
  merged + left_arr + right_arr
end

def subsets(array)
  sub_sets = []
  return [[]] if array.empty?
  popped = array.pop
  remaining_subs = subsets(array)
  sub_sets += remaining_subs + remaining_subs.map do |subset|
    subset + [popped]
  end
  sub_sets
end
