class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max){ false }
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num >= 0 && num <= @max
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    @store[num % num_buckets] = []
  end

  def include?(num)
    self[num].length > 0
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets
    @count += 1
    self[num] << num
  end

  def remove(num)
    if self[num].length > 0
      @count -= 1
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].length > 0
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.length * 2){ Array.new }
    @store.each do |bucket|
      if bucket[0]
        new_store[bucket[0] % new_store.length] = bucket
      end
    end

    @store = new_store
  end
end
