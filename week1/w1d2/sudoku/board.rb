require_relative 'tile'

# sudoku board
class Board

  attr_reader :grid

  def self.empty_grid
    Array.new(9) do
      Array.new(9) { Tile.new(0) }
    end
  end

  def initialize(grid = self.empty_grid)
    @grid = grid
  end

  def self.from_file(filename)
    lines = File.readlines(filename).map(&:chomp)
    tiles = lines.map do |row|
      nums = row.split('').map { |char| char.to_i }
      nums.map { |num| Tile.new(num) }
    end
    self.new(tiles)
  end

  def [](position)
    row, col = position
    grid[row][col]
  end

  def []=(position, value)
    row, col = position
    tile = grid[row][col]
    tile.value = value
  end

  def render
    puts "     #{(1..9).to_a.join(" | ")}"
    puts "\n"
    grid.each_with_index do |row, i|
      puts "#{i+1}    #{row.join(" | ")}"
      puts "    -----------------------------------"
    end
  end

  def rows
    grid
  end

  def columns
    rows.transpose
  end

  def square(idx)
    tiles = []
    x = (idx/3) * 3
    y = (idx/3) * 3

    (x...x +3).each do |i|
      (y...y + 3).each do |j|
        tiles << self[[i,j]]
      end
    end

    tiles
  end

  def squares
    (0..8).to_a.map { |i| square(i) }
  end

  def solved_set?(group)
    set = group.map { |tile| tile.value }
    set.sort == (0..9).to_a
  end

  def solved?
    rows.all? { |row| solved_set?(row) } &&
    columns.all? { |col| solved_set?(col) } &&
    squares.all? { |square| solved_set?(square) }
  end

end
