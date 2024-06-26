# frozen_string_literal: true

class Graph
  attr_accessor :graph

  def initialize
    @graph = create_graph
  end

  def create_graph
    graph = {}
    nodes = []
    create_nodes(nodes)
    create_edges(graph, nodes)
    graph
  end

  def create_nodes(nodes)
    (0..7).each do |num|
      (0..7).each do |num2|
        nodes << [num, num2]
      end
    end
  end

  def create_edges(graph, nodes)
    moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    nodes.each do |node|
      adjacent = []
      moves.each { |move| adjacent << [node[0] + move[0], node[1] + move[1]] }
      graph[node] = adjacent
    end

    remove_out_of_bounds(graph)
  end

  def remove_out_of_bounds(graph)
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
