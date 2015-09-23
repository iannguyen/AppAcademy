class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0.hash if self.empty?
    the_hash = 0
    self.each_with_index do |el,idx|
        el = el.to_s if el.is_a?(Symbol)
        el = el.chars.inject(0) {|x,i| x += i.ord} if el.is_a?(String)
        the_hash += el.hash * (el.hash * idx)
    end
    the_hash
  end
end

class String
  def hash
    self.split('').map {|x| x.ord}.hash
  end
end

class Hash
  def hash
    self.to_a.map {|x| x.hash}.inject(:+)
  end
end
