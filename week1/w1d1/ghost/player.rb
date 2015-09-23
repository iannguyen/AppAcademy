# Ghost Player class
class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def guess
    puts "It's #{name}'s turn!"
    letter = gets.chomp
  end

  def alert_invalid_guess(guess)
    puts "#{guess} is not a valid move, it must be a letter AND it must be able to form a word"
  end

  def to_s
    name
  end
end
