require_relative "static_array"


class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @store = StaticArray.new(8)
    @capacity = 8
    @start_idx = 0
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index >= length
    @store[check_index(index)]
  end

  # O(1)
  def []=(index, val)
    raise "index out of bounds" if index >= length
    @store[check_index(index)] = val
  end

  # O(1)
  def pop
    raise "index out of bounds"if length == 0
    #
    popped = @store[check_index(@length - 1)]
    @length -= 1
    popped
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    @length += 1
    @store[check_index( @length - 1)] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if length == 0
    @start_idx += 1
    @length -= 1
    @store[@start_idx - 1]
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    @length += 1
    @start_idx = check_index(-1)
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    (index + @start_idx) % @capacity
  end

  def resize!
    old_cap = @capacity
    @capacity *= 2
    new_store = StaticArray.new(@capacity)

    i = 0
    while i < @length
      new_store[check_index(i)] = @store[(i + @start_idx) % old_cap]
      i += 1
    end

    @store = new_store
  end
end
