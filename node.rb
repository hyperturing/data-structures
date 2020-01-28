class Node
  include Comparable
  attr_accessor :value, :left_node, :right_node
  def initialize(value, left_node = nil, right_node = nil)
    @value = value
    @left_node = left_node
    @right_node = right_node
  end

  def <=>(other)
    @value <=> other.value
  end
end
