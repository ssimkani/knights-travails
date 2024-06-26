# frozen_string_literal: true

require_relative 'graph'

# Class for knight moves method
class Knight
  # Creating a graph object
  def initialize
    @graph = Graph.new
  end

  # Method that takes start and end nodes as arguments and returns the shortest path
  def knight_moves(start_node, end_node)
    shortest_path = @graph.shortest_path(start_node, end_node)
    puts "You made it in #{shortest_path.length - 1} moves! Here's your path:\t\t"
    shortest_path.each { |coord| p coord }
  end
end
