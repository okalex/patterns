require_relative '../tree'

module Tree
  class BTree < Base

    def initialize
      super(Strategy.new)
    end

    class Strategy
      def add(node, value)
        return node if value == node.value

        child_idx = (value < node.value) ? 0 : 1
        child = node.children[child_idx]
        if child.nil?
          puts "Adding #{value} to #{node.to_s}"
          child = TreeNode.new(self, value)
          node.children[child_idx] = child
        else
          child = child.add(value)
        end
        child
      end

      def find(node, value)
        return node if node.value == value

        child_idx = (value < node.value) ? 0 : 1
        child = node.children[child_idx]
        child.nil? ? nil : child.find(value)
      end

      def traverse(node)
        str = "#{node.children[0] || ' '} #{node.children[1] || ' '}"
        puts str
        node.children[0].traverse if node.children[0]
        node.children[1].traverse if node.children[1]
      end

    end
  end
end
