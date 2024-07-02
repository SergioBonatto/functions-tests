# List.split_at <a> (xs : List a) (n : Nat) : Pair (List a) (List a)
# List.split_at a  xs                  Nat.zero    = Pair.new List.nil xs
# List.split_at a (List.nil  a_)      (Nat.succ n) = Pair.new List.nil List.nil
# List.split_at a (List.cons a_ x xs) (Nat.succ n) =
#   let tail = List.split_at xs n
#   let fst  = Pair.fst tail
#   let snd  = Pair.snd tail
#   Pair.new (List.cons x fst) snd

def split_at_half(xs):
  match xs:
    case List/Nil:
      return (List/Nil, List/Nil)
    case List/Cons:
      tail = split_at_half(xs.tail)
      match xs.tail:
        case List/Nil:
          return (List/Cons(xs.head), [])
        case List/Cons:
          (fst, snd) = tail
          return (List/Cons(xs.head, fst), List/Cons(xs.tail.head, snd))


def main():
  list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  return split_at_half(list)



