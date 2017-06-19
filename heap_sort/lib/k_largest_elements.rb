require_relative 'heap'

def k_largest_elements(array, k)
  mh = []
  pos = 0

  k.times do
    mh.unshift(array[pos])

    pos += 1
    BinaryMinHeap.heapify_down(mh, 0)
  end

  until pos >= array.length
    if array[pos] > mh[0]
      mh[0] = array[pos]
      BinaryMinHeap.heapify_down(mh, 0)
    end

    pos += 1
  end
  mh
end

#  naive
# def k_largest_elements(array, k)
#   heap_border = 0
#   arr = array.dup
#   prc = Proc.new { |a,b| b <=> a }
#
#   until heap_border == array.length - 1
#     heap_border += 1
#     BinaryMinHeap.heapify_up(arr, heap_border, heap_border + 1, &prc)
#   end
#
#   results = []
#
#   until arr.length == array.length - k
#     arr[0], arr[arr.length - 1] = arr[arr.length - 1], arr[0]
#     results << arr.pop
#     BinaryMinHeap.heapify_down(arr, 0, arr.length, &prc)
#   end
#
#   results
# end
