require_relative 'tree'

class KnightPathFinder
  attr_reader :position, :visited_positions, :root
  def initialize(pos)
    @position = pos
    @visited_positions = [pos]
    @root = PolyTreeNode.new(@position)
    build_move_tree
  end

  def build_move_tree
    queue = [@root]
    until queue.empty?
      node = queue.shift
      new_move_positions(node.value).each do |new_pos|
        new_node = PolyTreeNode.new(new_pos)
        new_node.parent=(node)
        queue << new_node
      end
    end
    nil
  end

  def find_path(end_pos)
    end_node = root.bfs(end_pos)
    end_node.trace_path_back
  end

  def new_move_positions(pos)
    new_pos = []
    valid_moves(pos).each do |place|
      if !@visited_positions.include?(place)
        @visited_positions << place
        new_pos << place
      end
    end
    new_pos
  end

  def valid_moves(pos)

    #######
    ##1#8##
    #2###7#
    ###K###
    #3###6#
    ##4#5##
    #######
    x ,y = pos
    pos1, pos2, pos3, pos4 = [x-1,y+2], [x-2,y+1], [x-2,y-1], [x-1,y-2]
    pos5, pos6, pos7, pos8 = [x+1,y-2], [x+2,y-1], [x+2,y+1], [x+1,y+2]

    positions = [pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8]

    valid = positions.select do |pos|
      x, y = pos
      x.between?(0,8) && y.between?(0,8)
    end
  end
end
