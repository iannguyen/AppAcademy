def my_min(array)
  min = nil
  (0..(array.length - 1)).each do |el|
    (0..(array.length - 1)).each do |other_el|
      if min.nil? || array[el] < min
        min = array[el]
      end
    end
  end
  min
end
# quadratic O(n**2)

def my_min_2(array)
  min = array.first
  (0..(array.length - 1)).each do |el|
    if array[el] < min
      min = array[el]
    end
  end
  min
end

# O(n) linear

def largest_subsum_1(array)
  subsums = []
  (0..(array.length - 1)).each do |first|
    (0..(array.length - 1)).each do |last|
      if first <= last
        subsums << array[first..last]
      end
    end
  end

  max = subsums.first.inject(:+)

  subsums.each do |subsum|
    if subsum.inject(:+) > max
      max = subsum.inject(:+)
    end
  end
  max
end

# O(n**2) quadratic

def largest_subsum_2(array)
  maximum = 0
  array.length.times do |idx|
    maximum = [array[idx] + maximum, maximum].max
  end
  maximum
end

# O(n) linear
