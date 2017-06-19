require 'byebug'
class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    self.next.prev = self.prev
    self.prev.next = self.next
    self.next = nil
    self.prev = nil
    return self
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return true if first == @tail
    false
  end

  def get(key)
    current = @head.next
    until current == @tail || current.next == nil

      if current.key == key
        return current.val
      else
        current = current.next
      end
    end
    nil
  end

  def include?(key)
    current = @head.next
    until current == @tail
      if current.key == key
        return true
      else
        current = current.next
      end
    end
    false
  end

  def append(key, val)
    appended = Node.new(key, val)
    @tail.prev.next = appended
    appended.prev = @tail.prev
    appended.next = @tail
    @tail.prev = appended
  end

  def update(key, val)
    current = @head
    until current == @tail
      if current.next.key == key
        current.next.val = val
        return val
      else
        current = current.next
      end
    end
    nil
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.next.prev = node.prev
        node.prev.next = node.next
        node.next = nil
        node.prev = nil
        return node
      end
    end
    nil
  end

  def each(&prc)
    current = @head.next
    until current == @tail
      prc.call(current)
      current = current.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
