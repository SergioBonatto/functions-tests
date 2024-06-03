# def main():
#   return "Hello, world!"

# def am_i_old(age):
#   if age < 18:
#     return "you're a kid"
#   else:
#     return "you're an adult"
#
# def main():
#   return am_i_old(32)

# def distance(ax, ay, bx, by):
#   dx = bx - ax
#   dy = by - ay
#   return (dx * dx + dy * dy) ^ 0.5
#
# def main():
#   return distance(10.0, 10.0, 20.0, 20.0)

# def distance(a, b):
#   (ax, ay) = a
#   (bx, by) = b
#   dx = bx - ax
#   dy = by - ay
#   return (dx * dx + dy * dy) ^ 0.5
#
# def main():
#   return distance((10.0, 10.0), (20.0, 20.0))

#
# Aperte ENTER ou digite um comando para continuar
# Errors:
# Error reading result from hvm. Output :
# thread 'main' panicked at src/hvm.rs:254:5:
# assertion failed: expo >= -63 && expo <= 63
# note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
# exit status: 101

# object V2 { x, y }
#
# def distance(a, b):
#   open V2: a
#   open V2: b
#   dx = b.x - a.x
#   dy = b.y - a.y
#   return (dx * dx + dy * dy) ^ 0.5
#
# def main():
#   return distance(V2 { x: 10.0, y: 10.0 }, V2 { x: 20.0, y: 20.0 })

# type Shape:
#   Circle { radius }
#   Rectangle { width, height }
#
# def area(shape):
#   match shape:
#     case Shape/Circle:
#       return 3.14 * shape.radius ^ 2.0
#     case Shape/Rectangle:
#       return shape.width * shape.height
#
# def main:
#   return area(Shape/Circle { radius: 10.0 })

# FIXME: não dá para redefinir tipos nativos, deixar claro no guide
# type List:
  # Nil
  # Cons { head, tail }
#
# def main:
#   my_list = List/cons { head: 1, tail: List/cons { head: 2, tail: List/cons { head: 3, tail: List/nil }}}
#   return my_list
#
# def main:
#   my_list = [1, 2, 3]
#   return my_list

# def main:
#   my_list = [1, 2, 3]
#   match my_list:
#     case List/Cons:
#       return my_list.head
#     case List/Nil:
#       return 0

# def parity(x):
#   result = "odd"
#   if x % 2 == 0:
#     result = "even"
#   return result

# def is_even(x):
#   if x % 2 == 0:
#     return "even"
#   else:
#     return "odd"
#
# def main():
#   return is_even(3)

# def main:
#   mul_2 = lambda x: x * 2
#   return mul_2(7)

# def sum(x):
#   total = 0
#   for i in range(10)
#     total += i
#   return total

# type Tree:
#   Node { ~lft, ~rgt }
#   Leaf { val }
#
# def sum(tree):
#   fold tree:
#     case Tree/Node:
#       return tree.lft + tree.rgt
#     case Tree/Leaf:
#       return tree.val
#
# def main:
#   tree = Tree/Node {
#     lft: Tree/Node { lft: Tree/Leaf { val: 1 }, rgt: Tree/Leaf { val: 2 } },
#     rgt: Tree/Node { lft: Tree/Leaf { val: 3 }, rgt: Tree/Leaf { val: 4 } }
#   }
#   return sum(tree)

# type Tree:
#   Node { ~lft, ~rgt }
#   Leaf { val }
#
# def enum(tree):
#   idx = 0
#   fold tree with idx:
#     case Tree/Node:
#       return Tree/Node {
#         lft: tree.lft(idx * 2 + 0),
#         rgt: tree.rgt(idx * 2 + 1),
#       }
#     case Tree/Leaf:
#       return (idx, tree.val)
#
# def main:
#   tree = Tree/Node {
#     lft: Tree/Node { lft: Tree/Leaf { val: 1 }, rgt: Tree/Leaf { val: 2 }, },
#     rgt: Tree/Node { lft: Tree/Leaf { val: 3 }, rgt: Tree/Leaf { val: 4 }, }
#   }
#   return enum(tree)

# FIXME: não aceita o hole
# def reverse(list):
#   fold list:
#     case List/Cons:
#       new_list = (List/Cons { head: list.tail, tail: list.head })
#       return new_list.tail
#     case List/Nil:
#       return List/Nil

# def main:
#   return reverse([1,2,3])


# type Tree:
#   Node { ~lft, ~rgt }
#   Leaf { val }
#
# def main():
  # bend x = 0:
#     when x < 3:
#       tree = Tree/Node { lft: go(x + 1), rgt: go(x + 1) }
#     else:
#       tree = Tree/Leaf { val: 7 }
#   return tree

# def main():
#   bend d = 0, i = 0:
#     when d < 16:
#       sum = go(d+1, i*2+0) + go(d+1, i*2+1)
#     else:
#       sum = i
#   return sum

def gen(d, x):
  switch d:
    case 0:
      return x
    case _:
      return (gen(d-1, x * 2 + 1), gen(d-1, x * 2))

def sum(d, t):
  switch d:
    case 0:
      return t
    case _:
      (t.a, t.b) = t
      return sum(d-1, t.a) + sum(d-1, t.b)

def swap(s, a, b):
  switch s:
    case 0:
      return (a,b)
    case _:
      return (b,a)

def warp(d, s, a, b):
  switch d:
    case 0:
      return swap(s + (a > b), a, b)
    case _:
      (a.a,a.b) = a
      (b.a,b.b) = b
      (A.a,A.b) = warp(d-1, s, a.a, b.a)
      (B.a,B.b) = warp(d-1, s, a.b, b.b)
      return ((A.a,B.a),(A.b,B.b))

def flow(d, s, t):
  switch d:
    case 0:
      return t
    case _:
      (t.a, t.b) = t
      return down(d, s, warp(d-1, s, t.a, t.b))

def down(d,s,t):
  switch d:
    case 0:
      return t
    case _:
      (t.a, t.b) = t
      return (flow(d-1, s, t.a), flow(d-1, s, t.b))

def sort(d, s, t):
  switch d:
    case 0:
      return t
    case _:
      (t.a, t.b) = t
      return flow(d, s, sort(d-1, 0, t.a), sort(d-1, 1, t.b))

def main:
  return sum(9, sort(9, 0, gen(9, 0)))
