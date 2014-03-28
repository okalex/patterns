require_relative '../lib/tree/b_tree'

class TestCase
  tree = Tree::BTree.new
  tree.add(5)
  tree.add(2)
  tree.add(3)
  tree.add(6)
  tree.add(1)

  puts tree.find(3)
  puts tree.find(4)
  puts tree.find(5)
  puts tree.find(6)
  puts tree.find(7)
end
