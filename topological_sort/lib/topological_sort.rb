require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  count = {}
  sorted = []
  free_queue = []

  vertices.each do |vertex|
    count[vertex.value] = vertex.in_edges.length
    if vertex.in_edges.empty?
      free_queue.unshift(vertex)
    end
  end

  until free_queue.empty?
    # debugger
    current = free_queue.pop
    # p free_queue.map{|e|e.value}
    sorted << current
    # p current.out_edges.length
    verts = []
    current.out_edges.each do |edge|
      count[edge.to_vertex.value] -= 1
      # vert = edge.to_vertex
      # verts << vert
    end


    vertices.each do |vertex|
      free_queue.unshift(vertex) if count[vertex.value] == 0 && sorted.index(vertex).nil?
    end

  end
  sorted = sorted.uniq
  return [] if sorted.length != vertices.length
  sorted
end
