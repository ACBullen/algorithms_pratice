## Almost sorted

# Timestamped data may not always make it into the database in the
# perfect order. Server loads, network routes, etc. Your job is to
# take in a very long sequence of numbers in real-time and efficiently
# print it out in the correct order. Each number is, at most, `k` away
# from its final sorted position. Target time complexity is `O(nlogk)`
# and target space is `O(k)`.

require_relative 'heap'

def almost_sorted(arr, k)
  k_heap = BinaryMinHeap.new

  until k_heap.count == k
    k_heap.push(arr.shift)
  end

  until k_heap.count == 0
    check_num = array.shift
    if check_num
      if check_num < k_heap.peak
        p check_num
      else
        p k_heap.extract
        k_heap.push(check_num)
      end
    else
      p k_heap.extract
    end
  end
end
