require 'byebug'
class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new {|a,b| a <=> b}
    @store = [];
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[@store.length - 1] = @store[@store.length - 1], @store[0]
    res = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, @store.length - 1, &@prc)
    res
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    if @store.length > 1
      BinaryMinHeap.heapify_up(@store, @store.length - 1, @store.length, &@prc)
    end
  end

  public
  def self.child_indices(len, parent_index)
    first_child = parent_index * 2 + 1
    second_child = parent_index * 2 + 2
    results = []
    results << first_child if first_child < len
    results << second_child if second_child < len
    results
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    # debugger
    prc ||= Proc.new {|a, b| a <=> b }
    my_child_indices = BinaryMinHeap.child_indices(len, parent_idx)

    return array if my_child_indices.empty?
    deciding_index = my_child_indices[0]
    if my_child_indices[1] && prc.call(array[my_child_indices[1]], array[my_child_indices[0]]) == -1
      deciding_index = my_child_indices[1]
    end


    if prc.call(array[parent_idx], array[deciding_index]) == 1
      array[parent_idx], array[deciding_index] = array[deciding_index], array[parent_idx]
      return BinaryMinHeap.heapify_down(array, deciding_index, len, &prc)
    end

    array
  end


  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new {|a,b| a <=> b}
    return array if child_idx == 0
    parent_idx = BinaryMinHeap.parent_index(child_idx)
    if prc.call(array[child_idx], array[parent_idx]) == -1
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      BinaryMinHeap.heapify_up(array, parent_idx, array.length, &prc)
    end

    array
  end
end
