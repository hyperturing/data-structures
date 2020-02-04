require_relative 'tree'

tree = Tree.new([1, 5, 7, 2, 9])

tree.preorder { |value| puts value}
puts ''

#puts tree.find(7).value

tree.insert(4)
tree.insert(5)

tree.preorder { |value| puts value}
puts ''
