class Node
  include Comparable
  attr_accessor :value, :left_node, :right_node
  def initialize(value)
    @value = value
    @left_node = @right_node = nil
  end

  def number_of_children
    if left_node.nil? && right_node.nil?
      0
    else
      left_node.nil? || right_node.nil? ? 1 : 2
    end
  end
end
