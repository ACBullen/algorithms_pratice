# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def initialize(length)
    @store = []
    @length = length
  end

  # O(1)
  def [](index)
    if index > @length
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

  protected
  attr_accessor :store
end
