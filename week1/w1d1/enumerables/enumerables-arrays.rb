# Extending Array Class
class Array
  def my_each(&blk)
    i = 0
    while i < length
      blk.call(self[i])
      i += 1
    end
  end

  def my_select(&blk)
    selected = []
    my_each { |el| selected << el if blk.call(el) }
    selected
  end

  def my_reject(&blk)
    selected = my_select { |el| blk.call(el) }
    self - selected
  end

  def my_any?(&blk)
    my_each do |el|
      return true if blk.call(el)
    end
    false
  end

  def my_all?(&blk)
    my_each do |el|
      return false unless blk.call(el)
    end
    true
  end

  def my_flatten
    flatten = []
    my_each do |el|
      el.is_a?(Array) ? flatten += el.my_flatten : flatten << el
    end
    flatten
  end

  def my_zip(*args)
    result = Array.new(length)
    (length).times do |idx|
      result[idx] = [self[idx]]
      args.my_each do |arr|
        result[idx] << arr[idx]
      end
    end
    result
  end

  def my_rotate(num = 1)
    if num > 0
      num.times { push(shift) }
    else
      (num.abs).times { unshift(pop) }
    end
    self
  end
end
