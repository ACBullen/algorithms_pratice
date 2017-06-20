class Vertex
  attr_accessor :in_edges, :out_edges
  attr_reader :value
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost
  end

  def destroy!

  end
end
