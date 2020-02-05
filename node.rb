class Node
  include Comparable
  attr_accessor :value, :left_node, :right_node
  def initialize(value)
    @value = value
    @left_node = @right_node = nil
  end

  def leaf?
    left_node.nil? && right_node.nil?
  end
end
