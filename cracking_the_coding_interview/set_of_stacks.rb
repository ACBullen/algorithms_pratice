# Create a class Set of Stacks which contains multiple stacks whose
# sizes are constrained by a max. When a stack reaches or exceeds the max,
# a new one is added to the set, otherwise the set of stacks will behave
# just like a single stack.

class SetOfStacks
  def initialize(max)
    @stacks = []
    @stacks << Stack.new
    @max = max
  end

  def push(el)
    @stacks << Stack.new if @stacks.length == 0
    if @stacks.last.count >= @max
      @stacks << Stack.new
    end

    @stacks.last.push(el)
  end

  def pop
    if @stacks.last.count == 0
      @stacks.pop
    end

    return nil if @stacks.length == 0
    @stacks.last.pop
  end

end

class Stack
  def initialize
    @store = []
    @count = 0
  end

  def pop
    popped = @store.pop
    @count -= 1 unless popped.nil
    popped
  end

  def push(el)
    @count += 1
    @store.push(el)
  end
end
