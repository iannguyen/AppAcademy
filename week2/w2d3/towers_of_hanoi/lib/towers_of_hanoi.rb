
class TowersOfHanoi
  attr_reader :stack

  def initialize(stack = [[3,2,1], [], []])
    @stack = stack
  end

  def move(from, to)
    raise "Invalid Move" unless (!stack[from].empty? && stack[to].empty?) ||
                                (stack[from].last < stack[to].last)
    piece = stack[from].pop
    stack[to].push(piece)
  end

  def game_over?
    stack[0].empty? && (stack[1].empty? || stack[2].empty?)
  end

  def play
    until game_over?
      render
      input_from = gets.chomp.to_i
      input_to = gets.chomp.to_i
      move(input_from, input_to)
    end
    "YEEAH"
  end

  def render
    puts "#{stack}"
  end

end

game = TowersOfHanoi.new
