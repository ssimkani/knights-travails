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

  def bfs(start_node, end_node)
    queue = [start_node]
    visited = { start_node => nil }

    until queue.empty?
      node = queue.shift
      break if node == end_node

      graph[node].each do |neighbor|
        unless visited.key?(neighbor)
          queue << neighbor
          visited[neighbor] = node
        end
      end
    end
    visited
  end

  def shortest_path(start_node, end_node)
    visited = bfs(start_node, end_node)
    path = []
    current = end_node
    while current != start_node
      path += [current]
      current = visited[current]
    end

    path.reverse.unshift(start_node)
  end
end

g = Graph.new
g.create_nodes
g.create_edges

p g.shortest_path([0, 0], [1, 2])
