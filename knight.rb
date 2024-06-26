# frozen_string_literal: true

require_relative 'graph'

class Knight
  def initialize
    @graph = create_graph
  end

  def create_graph
    graph = Graph.new
    graph.create_nodes
    graph.create_edges
    graph
  end

  def knight_moves(start_node, end_node)
    shortest_path = @graph.shortest_path(start_node, end_node)
    puts "You made it in #{shortest_path.length - 1} moves! Heres your path:\t\t"
    shortest_path.each { |coord| p coord }
  end
end
