# Given a sorted array consisting of only integers where every element appears twice except for one element
#which appears once.
#Find this single element that appears only once. Do it in O(logN) time and O(1) space.
def single_in_sorted(arr)
  # O(n) size will always
  # mid_idx = arr.length / 2
  # return arr[mid_idx] if ((arr[mid_idx - 1] != arr[mid_idx]) && (arr[mid_idx + 1] != arr[mid_idx]))
  # return arr[0] if arr.length == 1
  #
  # if arr[mid_idx] == arr[mid_idx - 1]
  #   if (mid_idx - 2 )> 0 &&  (mid_idx - 2 ) % 2 == 0
  #     single_in_sorted(arr[0..mid_idx - 2])
  #   else
  #     single_in_sorted(arr[mid_idx + 1.. -1])
  #   end
  # else
  #   if mid_idx + 2 < arr.length && (arr.length - mid_idx + 2) % 2 != 0
  #     single_in_sorted(arr[mid_idx + 1..-1])
  #   else
  #     single_in_sorted(arr[0..mid_idx-1])
  #   end
  # end

  lo = 0
  hi = arr.length - 1

  while lo < hi
    mid = (hi + lo) / 2
    if arr[mid] != arr[mid -1] && arr[mid] != arr[mid+1]
      return arr[mid]
    elsif (arr[mid] == arr[mid -1] && mid.odd?) ||(arr[mid] == arr[mid+1] && mid.even?)
      lo = mid + 1
    else
      hi = mid - 1
    end
  end
  arr[lo]
end


p(single_in_sorted([1,1,2,2,3,3,4,4,5]) == 5)
