# Post Order Traversal:
def post_order_traversal(tree_node, arr)
  return [] if tree_node.nil?
  left_traverse = in_order_traversal(tree_node.left) if tree_node.left
  right_traverse = in_order_traversal(tree_node.right) if tree_node.right
  left_traverse ||= []
  right_traverse ||= []

  [tree_node.value].concat(left_traverse).concat(right_traverse).concat(arr)
end

# Pre Order Traversal:
def pre_order_traversal(tree_node, arr)
  return [] if tree_node.nil?
  left_traverse = in_order_traversal(tree_node.left) if tree_node.left
  right_traverse = in_order_traversal(tree_node.right) if tree_node.right
  left_traverse ||= []
  right_traverse ||= []

  left_traverse.concat(right_traverse).concat([tree_node]).concat(arr)
end

# In Order Iterative:
def in_order_traversal(tree_node = @root)
  stack = []
  result = []
  cur_node = tree_node
  stack.push(cur_node)
  until stack.empty?
    cur_node = cur_node.left
    stack.push(cur_node) unless cur_node.nil?
    if cur_node == nil && !stack.empty?
      p printed = stack.pop
      result << printed
      cur_node = printed.right
    end
  end

  result
end
#
# LCA:
# In a binary search tree, an *ancestor* of a `example_node` is a node
# that is on a higher level than `example_node`, and can be traced directly
# back to `example_node` without going up any levels. (I.e., this is
# intuitively what you think an ancestor should be.) Every node in a binary
# tree shares at least one ancestor -- the root. In this exercise, write a
# function that takes in a BST and two nodes, and returns the node that is the
# lowest common ancestor of the given nodes. Assume no duplicate values.
