# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
  graph = []

  arr.each do |el|
    unless graph.any?{|vert| vert.value == el[0]}
      graph.push(Vertex.new(el[0]))
    end
    cur_vert = graph.select{|vert| vert.value == el[0]}
    
    unless graph.any?{|vert| vert.value == el[1]}
      graph.push(Vertex.new(el[1]))
    end
      dep_vert = graph.select{|vert| vert.value == el[1]}
      Edge.new(dep_vert[0], cur_vert[0])
  end
  contiguity = graph.map{|el| el.value}.sort
  (1..contiguity.last).each do |id|
    graph.push(Vertex.new(id)) if contiguity.index(id).nil?
  end
  # p graph.map{|el| "#{el.value}:#{el.out_edges.length}"}

  sorted = topological_sort(graph)
  p sorted.map {|el| el.value}.uniq

end
