require_relative 'tree'

def print_all_traversals(tree)
  puts "\nlevelorder tree traversal:"
  tree.levelorder { |value| puts value }
  puts "\npreorder tree traversal:"
  tree.preorder { |value| puts value }
  puts "\npostorder tree traversal:"
  tree.postorder { |value| puts value }
  puts "\ninorder tree traversal:"
  tree.inorder { |value| puts value }
end

def print_menu
  puts <<~HEREDOC
    \n1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
    2. Confirm that the tree is balanced by calling `#balanced?`
    3. Print out all elements in level, pre, post, and in order
    4. try to unbalance the tree by adding several numbers > 100
    5. Confirm that the tree is unbalanced by calling `#balanced?`
    6. Balance the tree by calling `#rebalance!`
    7. Confirm that the tree is balanced by calling `#balanced?`
    8. Print out all elements in level, pre, post, and in order
    9. Exit\n
  HEREDOC
end

step = 0
print_menu
until step == 9
  case step
  when 1
    tree = Tree.new(Array.new(10) { rand(1..100) })
    puts 'Tree created!!'
  when 2
    puts tree.balanced? ? 'Balanced!' : 'Not balanced!'
  when 3
    print_all_traversals(tree)
  when 4
    20.times do
      tree.insert(rand(150..500))
    end
    puts 'Inserted a whole bunch of random numbers in the tree'
  when 5
    puts tree.balanced? ? 'Balanced!' : 'Not balanced!'
  when 6
    puts 'Rebalancing tree'
    tree.rebalance
  when 7
    puts tree.balanced? ? 'Balanced!' : 'Not balanced!'
  when 8
    print_all_traversals(tree)
  end
  puts "\nPress enter to continue"
  gets
  print_menu
  step += 1
end

found_value = -1
until found_value.positive?
  guess = rand(1..100)
  found_value = guess if tree.find(guess) && tree.find(guess).number_of_children > 1
end

puts "Deleting #{found_value} from our tree"
tree.delete(found_value)
print_all_traversals(tree)
