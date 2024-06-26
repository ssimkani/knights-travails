# frozen_string_literal: true

class Graph
  attr_accessor :graph, :nodes

  def initialize
    @graph = {}
    @nodes = []
  end

  def create_nodes
    (0..7).each do |num|
      (0..7).each do |num2|
        nodes << [num, num2]
      end
    end
  end

  def create_edges
    moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    nodes.each do |node|
      adjacent = []
      moves.each { |move| adjacent << [node[0] + move[0], node[1] + move[1]] }
      graph[node] = adjacent
    end
  end

  def remove_out_of_bounds
    counter = 0
    graph.each do |node, value|
      value.each do |coord|
        graph[node][counter] = nil if coord[0].negative? || coord[1].negative? || coord[0] > 7 || coord[1] > 7
        counter += 1
      end
    end
  end
end

g = Graph.new
g.create_nodes
g.create_edges

puts g.graph
