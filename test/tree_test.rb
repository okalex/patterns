require_relative '../lib/tree/b_tree'

class TestCase
  arr = [5, 2, 3, 6, 1, 8, 7, 4, 9]
  tree = Tree::BTree.build(arr)

  tree.traverse
end
