class Node
  attr_accessor :position, :distance, :parent_nodes

  def initialize(position)
    @position = { 'x' => position[0], 'y' => position[1] }
    @parent_nodes = []
    @distance = 0
  end

  def add_parent(parent)
    @parent_nodes << parent
  end

  def print_position
    "[#{position['x']}, #{position['y']}]"
  end
end
