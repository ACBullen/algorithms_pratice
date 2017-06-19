## 500 files

# You are given 500 files, each containing the stock trading data for a
# company. Within each file all the trades have timestamps.
# The timestamps appear in ascending order. Your job is to create one
# file of all data in ascending time order. Achieve the best Time and
# Space complexity that you can, and don't modify the inputs.
require_relative "heap"

def five_hundred_files(arr_of_arrs)
  prc = Proc.new { |a, b| a[0] <=> b[0] }
  file_heap = BinaryMinHeap.new

  arr_of_arrs.each_with_index do |arr, idx|
    file_heap.push([arr[0], idx, 0])
  end

  result = []

  until file_heap.count == 0
    result_candidate = file_heap.extract

    if (arr_of_arrs[result_candidate[1]][result_candidate[2]])

      result.push(result_candidate[0])

      file_heap.push([arr_of_arrs[result_candidate[1]][result_candidate[2]],
                      result_candidate[1],
                      result_candidate[2] + 1])
    end
  end

  result
end
