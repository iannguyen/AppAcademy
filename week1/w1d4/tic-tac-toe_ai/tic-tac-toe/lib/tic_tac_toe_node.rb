require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      if board.winner == evaluator || board.winner.nil?
        return false
      else
        return true
      end
    end

    if evaluator != next_mover_mark
      children.all? do |childboard|
      blah = childboard.losing_node?(evaluator)
      return blah
      end
    else
      children.any? do |childboard|
      blah = childboard.losing_node?(evaluator)
      return blah
      end
    end
  end

  def winning_node?(evaluator)
  end
  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    3.times do |i|
      3.times do |j|
        if board[[i,j]].nil?
          copy = board.dup
          copy[[i,j]]= (next_mover_mark)
          future_mark = next_mover_mark == :x ? :o : :x
          node = TicTacToeNode.new(copy, future_mark, [i,j])
          children << node
        end
      end
    end
    children
  end

end
