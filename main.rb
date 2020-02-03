require_relative 'tree'

tree = Tree.new([1, 5, 7, 2, 9])

tree.preorder { |value| puts value}
puts ""
tree.inorder { |value| puts value}
puts ""
tree.postorder { |value| puts value}