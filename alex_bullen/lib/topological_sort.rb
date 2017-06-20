require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  free_queue = []

  vertices.each do |vertex|
    if vertex.in_edges.empty?

      free_queue.unshift(vertex)
    end
  end

  until free_queue.empty?
    # debugger
    current = free_queue.pop
    # p free_queue.map{|e|e.value}
    sorted << current
    # p current.out_edges.empty?
    verts = []
    current.out_edges.each do |edge|
      # p "from",edge.from_vertex.value,"to", edge.to_vertex.value
      vert = edge.to_vertex
      verts << vert
      edge.destroy!
    end

    verts.each do |vert|
      if vert.in_edges.empty?
        free_queue.unshift(vert)
      end
    end
  end

  sorted
end
