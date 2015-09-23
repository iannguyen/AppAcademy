# sudoku tiles
class Tile
  attr_accessor :value, :given

  def initialize(value)
    @value = value
    @given = value == 0 ? false : true
  end

  def to_s
    value == 0 ? " " : value.to_s
  end

  def value=(new_value)
    if given?
      puts "Can't change given value."
    else
      @value = new_value
    end
  end

  def given?
    @given
  end
end
