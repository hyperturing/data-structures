require_relative 'node'

BOARD_SIZE = 5

def knight_moves(start_move, end_move)
  # Our queue of nodes to traverse:
  node_queue = [Node.new(start_move)]
  visited = [start_move]

  until node_queue.empty?
    # Queue and traverse each possible move
    #   Before moving onto the next move
    node = node_queue.pop
    moves = get_legal_moves(node.position['x'], node.position['y'], BOARD_SIZE)
    moves.each do |move|
      # Push the space to the queue if not already visited
      #   Record the space's parent and distance from start
      next if visited.include?(move)

      move_node = Node.new(move)
      move_node.add_parent(node)
      move_node.distance = node.distance + 1
      node_queue.unshift(move_node)
      visited.push(move)
    end
    return message(node) if node.position['x'] == end_move[0] && node.position['y'] == end_move[1]
  end
end

def get_legal_moves(row, column, board_size)
  # Returns an array of valid moves for the knight piece
  #   Use the knight piece's move pattern
  #   and filter out moves that leave the board
  move_offsets = [[2, -1], [1, -2], [1, 2], [2, 1],
                  [-1, -2], [-2, -1], [-1, 2], [-2, 1]]
  moves = move_offsets.each do |offset|
    offset[0] += row
    offset[1] += column
  end
  moves.select do |move|
    (0..board_size).cover?(move[0]) &&
      (0..board_size).cover?(move[1])
  end
end

def traverse_path(node)
  # Traverse our list to the end, appending node values to an accumulator
  return if node.nil? || node.empty?

  puts node.first.print_position
  traverse_path(node.first.parent_nodes)
end

def message(node)
  # Note: The path currently prints out in reverse order
  puts "You made it in #{node.distance} moves! Here's your path:"
  puts node.print_position
  traverse_path(node.parent_nodes)
  puts
end

knight_moves([0, 0], [4, 3])
knight_moves([0, 0], [1, 2])
knight_moves([0, 0], [3, 3])
knight_moves([3, 3], [0, 0])