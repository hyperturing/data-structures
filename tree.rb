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

    current_node = Node.new(array[middle_index])
    current_node.left_node = build_tree(array, start_index, middle_index - 1)
    current_node.right_node = build_tree(array, middle_index + 1, end_index)
    current_node
  end

  def insert(value, current_node = @root)
    case current_node.value <=> value
    when 0
      puts 'Duplicate value, stopping'
    when 1
      current_node.left_node.nil? ? current_node.left_node = Node.new(value) : insert(value, current_node.left_node)
    when -1
      current_node.right_node.nil? ? current_node.right_node = Node.new(value) : insert(value, current_node.right_node)
    end
  end

  def preorder(current_node = @root)
    return if  current_node.nil?

    yield current_node.value
    preorder(current_node.left_node) { |value| yield value }
    preorder(current_node.right_node) { |value| yield value }
  end

  def inorder(current_node = @root)
    return if current_node.nil?

    preorder(current_node.left_node) { |value| yield value }
    yield current_node.value
    preorder(current_node.right_node) { |value| yield value }
  end

  def postorder(current_node = @root)
    return if current_node.nil?

    preorder(current_node.left_node) { |value| yield value }
    preorder(current_node.right_node) { |value| yield value }
    yield current_node.value
  end

  def find(value, current_node = @root)
    return nil if current_node.nil?

    case current_node.value <=> value
    when 1
      find(value, current_node.left_node)
    when -1
      find(value, current_node.right_node)
    when 0
      current_node
    end
  end
end
