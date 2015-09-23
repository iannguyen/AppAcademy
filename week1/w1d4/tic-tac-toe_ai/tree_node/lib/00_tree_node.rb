class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end


  def parent=(property)
    if !self.parent.nil?
      self.parent.children.delete(self)
    end
    @parent = property
    property.children << self unless property.nil? || property.children.include?(self)
  end

  def add_child(child_node)
    @children << child_node
    child_node.parent=(self)
  end

  def remove_child(child)
    raise "error" if child.parent.nil?
    child.parent=nil
  end

  def dfs(target_value)
      return self if self.value == target_value
      #each returns original array
      children.each do |child|
        result = child.dfs(target_value)
        return result unless result.nil?
      end
      nil
      # if !self.children.empty?
      #     return_val = self.children.find do |kid|
      #       # puts kid.value
      #       kid.dfs(target_value)
      #     end
      #     puts return_val
      #   else
      #     nil
      # end

  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      if node.value == target_value
        return node
      else
        queue += node.children
      end
    end
    nil
  end
end
