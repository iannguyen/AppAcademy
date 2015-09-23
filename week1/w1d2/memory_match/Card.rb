class Card
  attr_accessor :value, :face

  def initialize(value)
    @face = false
    @value = value
  end

  def hide
    self.face = false
  end

  def reveal
    self.face = true
  end

  def to_s
    value
  end

  def ==(card)
    card == value
  end

  def inspect
    face ? value : 'X'
  end
end
