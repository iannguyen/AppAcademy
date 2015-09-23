require_relative 'card'
require 'byebug'

class Board
  attr_reader :grid, :size
  def initialize(size = 4)
    @size = size
    @grid = Array.new(size) { Array.new(size) }
  end

  def populate
    cards = []
    pairs = (size**2) / 2
    ((1..pairs).to_a * 2).shuffle.each { |num| cards << Card.new(num) }

    grid.each_with_index do |row, r|
      row.each_index do |col|
        self[[r, col]] = cards.shift
      end
    end
  end

  def to_s
    grid
  end

  def render
    p grid
  end

  def won?
    grid.flatten.all? do |card|
      card.face == true
    end
  end

  def reveal(position)
    self[position].reveal
  end

  def [](position)
    row, col = position
    grid[row][col]
  end

  def []=(position, value)
    row, col = position
    grid[row][col] = value
  end
end
