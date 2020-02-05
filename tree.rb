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

  def rebalance
    levelorder_array = levelorder
    @root = build_tree(levelorder_array, 0, levelorder_array.size - 1)
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

  def levelorder(current_node = @root, level_array = [], queue = [])
    return if current_node.nil?

    queue.push(current_node)
    level_array.push(current_node.value)
    until queue.empty?
      node_to_print = queue.pop

      yield node_to_print.value if block_given?
      levelorder(node_to_print.left_node, level_array) { |value| yield value if block_given? }
      levelorder(node_to_print.right_node, level_array) { |value| yield value if block_given? }
    end
    level_array
  end

  def depth(current_node = @root)
    if current_node.nil?
      0
    else
      [depth(current_node.left_node), depth(current_node.right_node)].max + 1
    end
  end

  def balanced?(current_node = @root)
    if current_node.nil?
      true
    else
      right_depth = depth(current_node.left_node)
      left_depth = depth(current_node.right_node)

      balanced?(current_node.left_node) &&
        balanced?(current_node.right_node) &&
        (right_depth - left_depth) <= 1
    end
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
