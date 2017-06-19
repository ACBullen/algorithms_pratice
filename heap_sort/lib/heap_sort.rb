require_relative "heap"
require 'byebug'
class Array
  def heap_sort!
    # debugger
    heap_border = 0
    prc = Proc.new { |a,b| b <=> a }
    until heap_border == length - 1
      heap_border += 1
      BinaryMinHeap.heapify_up(self, heap_border, heap_border + 1, &prc)
    end
    until heap_border == 0
      self[0], self[heap_border] = self[heap_border], self[0]
      BinaryMinHeap.heapify_down(self, 0, heap_border, &prc)
      heap_border -= 1
    end

    self
  end
end
