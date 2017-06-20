# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node.rb'
class BinarySearchTree
  attr_accessor :root
  def initialize(root = nil)
    @root = root
  end

  def insert(value)
    new_node = BSTNode.new(value)
    if @root.nil?
      @root = new_node
      return value
    end
    cur_node = @root
    inserting_point = nil
    value > @root.value ? inserting_point = @root.right : inserting_point = @root.left
    until inserting_point.nil?
      cur_node = inserting_point
      value > inserting_point.value ? inserting_point = inserting_point.right : inserting_point = inserting_point.left
    end

    if value > cur_node.value
      cur_node.right = new_node
      new_node.parent = cur_node
    else
      cur_node.left = new_node
      new_node.parent = cur_node
    end

    value
  end 

  def find(value, tree_node = @root)
    return nil if tree_node == nil

    if value == tree_node.value
      return tree_node
    elsif value > tree_node.value
      find(value, tree_node.right)
    elsif value < tree_node.value
      find(value, tree_node.left)
    end
  end

  def delete(value)
    delete_node = find(value)
    return nil if delete_node.nil?
    if delete_node.left.nil? && delete_node.right.nil?
      if delete_node == @root
        @root = nil
        return value
      elsif delete_node.value > delete_node.parent.value
        delete_node.parent.right = nil
        return value
      else
        delete_node.parent.left = nil
        return value
      end
    end
    former_parent = delete_node.parent
    if delete_node.left.nil?
      replace_child = delete_node.right
      replace_child.parent = former_parent
      former_parent.right == delete_node ? former_parent.right = replace_child : former_parent.left = replace_child
      replace_child.right = delete_node.right unless replace_child.right == replace_child
    else
      replace_child = maximum(delete_node.left)
      if replace_child.left
        lefty = replace_child.left
        lefty.parent = replace_child.parent
        lefty.parent.right = lefty
      end
      replace_child.parent = former_parent
      replace_child.left = delete_node.left unless delete_node.left == replace_child
      replace_child.right = delete_node.right
      replace_child.value > former_parent.value ? former_parent.right = replace_child : former_parent.left = replace_child
    end
    delete_node.parent = nil
    delete_node.left = nil
    delete_node.right = nil
    delete_node.value
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    cur_node = tree_node
    until cur_node.right.nil?
      cur_node = cur_node.right
    end
    cur_node
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil?

    levels = 0

    if tree_node.right.nil? && tree_node.left.nil?
      return levels
    else
      right_levels = depth(tree_node.right)
      left_levels = depth(tree_node.left)
      right_levels > left_levels ? levels += right_levels + 1 : levels += left_levels + 1
    end

    return levels
  end

  def is_balanced?(tree_node = @root)
    if depth(tree_node.right) == depth(tree_node.left)
      true
    else
      false
    end
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [] if tree_node.nil?
    left_traverse = in_order_traversal(tree_node.left) if tree_node.left
    right_traverse = in_order_traversal(tree_node.right) if tree_node.right
    left_traverse ||= []
    right_traverse ||= []

    return left_traverse.concat([tree_node.value]).concat(right_traverse).concat(arr)
  end


  private
  # optional helper methods go here:
  def promote_child(tree_node)
    if tree_node.left.nil?
      replace_child = tree_node.right
    elsif tree_node.right.nil?
      return
    else
      replace_child = maximum(tree_node.left)
    end

    if replace_child.value > tree_node.parent.value
      tree_node.parent.right = replace_child
    else
      tree_node.parent.left = replace_child
    end
    replace_child.left = tree_node.parent.left
    replace_child.right = tree_node.parent.right
    promote_child(replace_child)

    replace_child.parent = tree_node.parent


  end
end
