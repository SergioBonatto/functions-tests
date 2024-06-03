// # a binary tree
type MyTree:
  Node { val, ~left, ~right }
  Leaf

// # sums all values in a tree
def sum(tree):
  fold x:
    case Node:
      return val + tree.left + tree.right
    case Leaf:
      return 0

// # generates a binary tree of given depth
def gen(depth):
  bend val = 0:
    when val < depth:
      tree = Node { val: val, left: go(val+1), right: go(val+1) }
    else:
      tree = Leaf
  return tree

// # returns the sum of 0..2^16
def main:
  return sum(gen(16))
