require_relative 'binary_search_tree'

def kth_largest(tree_node, k, arr = [])
  return arr unless arr.is_a?(Array)
  return arr[k - 1] if arr.length >= k

  right_traverse = kth_largest(tree_node.right, k, arr) if tree_node.right
  right_traverse ||= []
  return right_traverse unless right_traverse.is_a?(Array)

  left_traverse = kth_largest(tree_node.left, k, arr) if tree_node.left
  left_traverse ||= []
  return left_traverse unless left_traverse.is_a?(Array)

  arr = right_traverse.concat([tree_node]).concat(left_traverse)
  return arr[k-1] if arr.length >= k
  return arr
end

# naive solution
# def kth_largest(tree_node, k)
#   captured_ary = []
#   tree = BinarySearchTree.new(tree_node)
#   res = tree.in_order_traversal
#
#   tree.find(res[res.length - k])
#
# end
