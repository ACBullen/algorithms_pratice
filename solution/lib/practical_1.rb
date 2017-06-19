# Given a doubly linked list, like the one you built, reverse it.
# You can assume that this method is monkey patching the LinkedList class
# that you built, so any methods and instance variables in that class
# are available to you.

class LinkedList
  # ....

  def reverse
    current = @head.next
    until current == @tail
      prev_node = node.prev
      next_node = node.next
      node.next = prev_node
      node.prev = next_node
      current = next_node
    end
    @tail.prev = current
    @head, @tail = @tail, @head
  end
end
