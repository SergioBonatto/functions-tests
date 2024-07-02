type Arr:
  Empty
  Single {a}
  Concat {fst, snd}

# Sums all elements in a concatenation tree
def sum(tree):
  match tree:
    case Arr/Empty:
      return 0
    case Arr/Single:
      return tree.a
    case Arr/Concat:
      return sum(tree.fst) + sum(tree.snd)
     
# QuickSort
def qsort(p, s, xs):
  match xs:
    case List/Nil:
      return Arr/Empty
    case List/Cons:
      match xs.tail:
        case List/Nil:
          return Arr/Single(xs.head)
        case List/Cons:
          return split(p, s, xs.tail, List/Nil, List/Nil)

# Splits list in two partitions
def split(p, s, xs, min, max):
  match xs:
    case List/Nil:
      s = s >> 1
      min = qsort((p - s), s, min)
      max = qsort((p + s), s, max)
      return Arr/Concat(min, max)
    case List/Cons:
      return place(p, s, (xs.head < p), xs.head, xs.tail, min, max)

# Moves element to its partition
def place(p, s, b, x, xs, min, max):
  switch b:
    case 0:
      return split(p, s, xs, min, List/Cons(x, max))
    case _:
      return split(p, s, xs, List/Cons(x, min), max)

# Generates a random list
def rnd(n):
  switch n == 0:
    case 0:
      return List/Cons(random(10000 - n), rnd(n - 1))
    case _:
      return List/Nil

# Generates a random number
def random(n):
  switch n == 0:
    case 0:
      return (random(n - 1) * 1664525 + 101387) % (2 ** 10 ) #4294967296
    case _:
      return 0

# The initial pivot
pivot = (2 ** 23)



def main():
  return sum(qsort(pivot, pivot, rnd(4096)))
  # return (rnd(1000))

# sum qsort 1000 pivo 214748  = 417255
# sum rnd   1000              = 15651375

# λa (a
#   Arr/Concat/tag λb (b
#   Arr/Concat/tag λc (c
#   Arr/Concat/tag λd (d
#   Arr/Concat/tag λe (e
#   Arr/Single/tag 35809)
#   Arr/Empty)
#   Arr/Empty)
#   Arr/Empty) λf (f
#   Arr/Concat/tag λg (g
#   Arr/Single/tag 154358) λh (h
#   Arr/Concat/tag λi (i
#   Arr/Single/tag 289211) λj (j
#   Arr/Single/tag 423850))))
