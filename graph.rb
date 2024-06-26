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
    nodes
  end
end
