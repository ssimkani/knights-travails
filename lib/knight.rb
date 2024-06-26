# frozen_string_literal: true

require_relative 'graph'

class Knight
  def initialize
    @graph = Graph.new
  end

  def knight_moves(start_node, end_node)
    shortest_path = @graph.shortest_path(start_node, end_node)
    puts "You made it in #{shortest_path.length - 1} moves! Heres your path:\t\t"
    shortest_path.each { |coord| p coord }
  end
end
