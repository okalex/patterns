require_relative './tree_node'

module Tree
  class Base
    attr_reader :root

    def initialize(strategy)
      @strategy = strategy
    end

    def self.build(arr)
      tree = new
      arr.each do |el|
        tree.add(el)
      end
      tree
    end

    def add(value)
      if @root.nil?
        @root = TreeNode.new(@strategy, value)
      else
        @root.add(value)
      end
    end

    def find(value)
      return nil if @root.nil?
      @root.find(value)
    end

    def traverse
      return if @root.nil?
      puts @root.value
      @root.traverse
    end

  end
end
