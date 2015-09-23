require 'set'

def two_sum?(arr, target)

  arr.each_with_index do |el1,idx1|
    (idx1 + 1..arr.length).each_with_index do |el2,idx2|
      return true if el1 + el2 == target
    end
  end
  false
end

# O(n**2) quadratic


def okay_two_sum?(arr, target)
  found = false
  arr.each do |el|
    return true if binary_search(arr, target - el)
  end
  found
end

# O(n logn) linear

def binary_search(arr, target)
  return false if arr.empty?
  mid = (arr.length / 2)
  if arr[mid] < target
    binary_search(arr.drop(mid + 1), target)
  elsif arr[mid] > target
    binary_search(arr.take(mid), target)
  else
    true
  end
end

# O(log n)

def hash_map(arr, target)
  set = Set.new
  arr.each do |el|
    set << el
  end
  arr.each do |el|
    return true if set.include?(target - el)
  end
  false
end

# O(n) linear
