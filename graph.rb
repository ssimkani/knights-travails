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

    remove_out_of_bounds
  end

  def remove_out_of_bounds
    graph.each do |node, value|
      value.each do |coord|
        if coord[0].negative? || coord[1].negative? || coord[0] > 7 || coord[1] > 7
          graph[node][value.index(coord)] =
            nil
        end
      end
      value.compact!
    end
  end

  def bfs(start)
    queue = [start]
    arr = []
    until queue.empty?
      node = queue.shift
      yield node if block_given?
      arr << node
      graph[node].each { |coord| queue << coord unless queue.include?(coord) || arr.include?(coord) }
    end
    arr
  end
end

g = Graph.new
g.create_nodes
g.create_edges

bfs = g.bfs [0, 0]
p bfs.length
