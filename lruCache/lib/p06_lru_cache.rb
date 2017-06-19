require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_node!(@map[key])
      @map[key].val
    else
      val = @prc.call(key)
      @store.append(key, val)
      @store.last.to_s + " un-cached"
      @map[key] = @store.last
      eject! if @map.count > @max
      @store.last.val
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    @map[key] = Node.new(key, val)

    update_node!(@map[key])
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    node.prev.next = node.next
    node.next.prev = node.prev
    node.prev = @store.tail.prev
    node.next = @store.tail
    @store.tail.prev = node
    node.prev.next = node
  end

  def eject!
    @map.delete(@store.first.key)
    @store.first.remove
  end
end
