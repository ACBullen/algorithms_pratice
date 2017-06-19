## Problem
This is a two part problem:
1. First, write a series of instructions on how to build out an LRU Cache (pretend
the person you're writing to has no idea how to build one. Don't forget to address
the reasoning behind using particular data structures).
2. Implement an LRU Cache from scratch with no outside references. **Don't look
at the code or instructions from your homework!**

## Solution

### Part 1
Write first part here:
1. First we're going to need to know how many elements we'll save in our
cache, either provided by the creator, or say 3 and set that value to the max.
2. In order to be able to look values up in constant time, we'll want a hashmap, but
to optimize our add/delete/move time, we'll want the functionality of a linkedlist.
3. The hashmap will store the key for the item we care about, with a value pointer to
the node in the linkedlist holding the value (and by its location how long ago it was accessed).
4. If that item isn't in the linked list, we'll append it to the tail, using a given proc to find the assoiated value, otherwise we update its location and return the value. (thus saving on the computation work for cached values)
5. If the linked list stores max values already, we'll update its position to be at the tail.
6. If we would exceed the max, we remove the element closest to the head, and delete it from the HashMap

### Part 2
```ruby
class LRUCache
  def initialize(max = 3, prc)
    @max = max
    @prc = prc
    @map = HashMap.new
    @list = LinkedList.new
  end

  def get(key)
    if @map[key]
      update!(@map[key])
      @map[key].val
    else
      @map[key] = Node.new(key, @prc.call(key))
      @list.append(@map[key])
      eject! if @map.count > @max
      @map[key].val
    end
  end

  def update!(node)
    node.next.prev = node.prev
    node.prev.next = node.next

    old_last = @list.last
    @list.last.next = node
    @tail.prev = node

    node.next = @tail
    node.prev = old_last
  end
end
```
