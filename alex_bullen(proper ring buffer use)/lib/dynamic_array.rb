require_relative "static_array"


class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @store = StaticArray.new(8);
    @capacity = 8
  end

  # O(1)
  def [](index)
    if index >= @length
      raise "index out of bounds"
    else
      @store[index]
    end
  end

  # O(1)
  def []=(index, value)
    if index > @length
      raise "index out of bounds"
    else
      @store[index] = value
    end
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    popped, @store[@length - 1]= @store[@length - 1], nil
    @length -= 1
    return popped
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @capacity == @length
      @capacity *= 2
      @store = StaticArray.new(@capacity)
      @store[@length] = val
    else
      @store[@length] = val
    end
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    i = 0
    while i < @length
      @store[i] = @store[i + 1]
      i += 1
    end
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if @capacity == @length
      @capacity *= 2
      @store = StaticArray.new(@capacity)
    end
    i = @length
    while i > 0
      @store[i] = @store[i - 1]
      i -= 1
    end
    @store[0] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
end
