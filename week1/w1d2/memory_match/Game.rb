require_relative 'board'
require_relative 'card'
class Game
  attr_accessor :board, :guessed_pos, :previous_guess
  def initialize(num = 4)
    @board = Board.new(num)
    @board.populate
    @previous_guess = nil
    @guessed_pos = nil
  end

  def get_a_guess
    print 'Give me a position: '
    @guessed_pos = gets.chomp.split(',').map(&:to_i)
  end

  def process_move(position)
    board.reveal(position)
    board.render
  end

  def match?(guess_1, guess_2)
    board[guess_1].value == board[guess_2].value
  end

  def play
    one_round until board.won?
    puts 'The Game Is Over.'
  end

  def one_round
    process_move(get_a_guess)
    @previous_guess = @guessed_pos
    process_move(get_a_guess)
    board[@previous_guess].hide unless match?(@previous_guess, @guessed_pos)
    board[@guessed_pos].hide unless match?(@previous_guess, @guessed_pos)
    if match?(@previous_guess, @guessed_pos)
      puts 'You have found a match!'
    else
      puts 'Try again!'
    end
  end
end
