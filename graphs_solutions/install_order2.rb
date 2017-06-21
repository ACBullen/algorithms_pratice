# In this version of the problem, all packages will be listed, including
# independent ones (independant packages have nil or no value for their
# dependencies), but the package ids may not be numbers.
require_relative 'topological_sort'
require 'set'
def install_order2(arr)
  vert_hash = {}

  arr.each do |tuple1, tuple2|
    unless vert_hash[tuple1]
      vert_hash[tuple1] = Vertex.new(tuple1)
    end

    unless vert_hash[tuple2] || tuple2.nil?
      vert_hash[tuple2] = Vertex.new(tuple2)
    end

    Edge.new(vert_hash[tuple2], vert_hash[tuple1]) unless tuple2.nil?
  end

  topological_sort(vert_hash.values).map { |el| el.value }

end

arr = [[3, 1], [2, 1], [6, 5], [3, 6], [3, 2],
       [4, 3], [9, 1], [1, nil], [5, nil]]
arr2 = [['a', 'b'], ['c', 'b'], ['d', 'a'], ['b'], ['e', 'd']]

p install_order2(arr)
p install_order2(arr2)
