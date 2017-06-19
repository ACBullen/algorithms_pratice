class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if length <= 1
    pivot = array[0]
    left = []
    right = []

    array.each do |el|
      case el <=> pivot
      when -1
        left << el
      when 0
        left << el
      when 1
        right << el
      end
    end

    return Quicksort.sort1(left).concat([pivot]).concat(Quicksort.sort1(right))
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    anchored_idx = QuickSort.partition(array, start, length, &prc)

    QuickSort.sort2!(array, start, anchored_idx - start, &prc)
    QuickSort.sort2!(array, anchored_idx + 1, array.length - anchored_idx, &prc)
    # pivot_idx = rand(length - start)
    # pivot = array[pivot_idx]
    # prc = prc || Proc.new {|a,b| a <=> b}
    #
    # border = start
    # i = start
    # while i < start + length
    #   if i != pivot_idx
    #     if prc.call(array[i], pivot) == -1
    #       border_swap_idx = border + 1
    #       border_swap_idx += 1 if border_swap_idx == pivot_idx
    #       array[i], array[border_swap_idx] = array[border_swap_idx], array[i]
    #       border += 1
    #     end
    #   end
    #   i += 1
    # end
    # p array

  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|a,b| a<=>b}
    border = start
    pivot_idx = start
    pivot = array[pivot_idx]
    i = start

    while i < start+length
      i += 1 if i == pivot_idx
      if prc.call(array[i], pivot) == -1
        swapper = border + 1
        swapper += 1 if border + 1 == pivot_idx && array[border+2]
        array[i], array[swapper] = array[swapper], array[i]
        border += 1
        # p array
      end
      i += 1
    end
    if array[pivot_idx] == pivot
      array[pivot_idx], array[border] = array[border], array[pivot_idx]
    end
    border
  end
end
