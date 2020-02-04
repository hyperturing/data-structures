class Node
  include Comparable
  attr_accessor :value, :left_node, :right_node
  def initialize(value)
    @value = value
    @left_node = @right_node = nil
  end

  def is_leaf?
    self.left_node.nil? && self.right_node.nil?
  end
end
