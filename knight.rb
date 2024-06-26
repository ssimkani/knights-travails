# frozen_string_literal: true

require_relative 'graph'

class Knight
  attr_reader :graph

  def initialize
    @graph = Graph.new
  end
end
