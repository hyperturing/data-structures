require_relative 'node'

class Tree
  def initialize(array)
    array = array.sort.uniq
    @root = build_tree(array, 0, array.size - 1)
    puts @root
  end

  def build_tree(array, start_index, end_index)
    return nil if start_index > end_index

    middle_index = (start_index + end_index) / 2

    root_node = Node.new(array[middle_index])
    root_node.left_node = build_tree(array, start_index, middle_index - 1)
    root_node.right_node = build_tree(array, middle_index + 1, end_index)
    root_node
  end

  def preorder(current_root = @root)
    return if  current_root.nil?

    yield current_root.value
    preorder(current_root.left_node) { |value| yield value }
    preorder(current_root.right_node) { |value| yield value }
  end

  def inorder(current_root = @root)
    return if current_root.nil?

    preorder(current_root.left_node) { |value| yield value }
    yield current_root.value
    preorder(current_root.right_node) { |value| yield value }
  end

  def postorder(current_root = @root)
    return if current_root.nil?

    preorder(current_root.left_node) { |value| yield value }
    preorder(current_root.right_node) { |value| yield value }
    yield current_root.value
  end
end
