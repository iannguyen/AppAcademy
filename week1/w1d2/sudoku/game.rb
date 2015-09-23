require_relative 'board'
require_relative 'tile'
# sudoku game class
class Game
  attr_reader :board

  def self.from_file(filename)
    board = Board.from_file(filename)
    new(board)
  end

  def initialize(board)
    @board = board
  end

  def play_turn
    render
    pos = get_pos
    val = get_val
    board[pos] = val
  end

  def run
    play_turn until solved?
    render
    puts 'YOU WIN!'
  end

  def render
    board.render
  end

  def get_pos
    pos = nil
    until pos && valid_pos?(pos)
      puts "Please enter a valid position, (i.e. '1,2')"
      print '>'
      pos = parse_pos(gets.chomp)
    end
    pos
  end

  def get_val
    val = nil
    until val && valid_val?(val)
      puts 'Please enter a valid value between 1 and 9, 0 to clear the tile.'
      print '>'
      val = parse_val(gets.chomp)
    end
    val
  end

  def solved?
    board.solved?
  end

  def parse_pos(pos)
    pos.split(',').map { |num| Integer(num)-1 }
  end

  def parse_val(val)
    Integer(val)
  end

  def valid_pos?(pos)
    pos.is_a?(Array) && pos.count == 2
  end

  def valid_val?(val)
    val.is_a?(Integer) && val.between?(0, 9)
  end
end

sudoku = Game.from_file(gets.chomp).run if $PROGRAM_NAME == __FILE__
