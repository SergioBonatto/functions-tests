type Maybe:
  None
  Some {value} 

# Função auxiliar para encontrar o vértice com a menor distância
# Graph.minimum.distance (lp: Data.List (Data.Pair Data.U60 Data.U60)) : (Data.Pair Data.U60 Data.U60)
def minimum_distance(xs):
  match xs:
    case List/Nil:
      return (0, 0)
    case List/Cons:
      match xs.tail:
        case List/Nil:
          return xs.head
        case List/Cons:
          (head.fst, head.snd) =  xs.head
          (head.tail.fst, head.tail.snd) = xs.tail.head
          if head.snd < head.tail.snd:
            return minimum_distance(List/Cons (xs.head, xs.tail.tail))
          else:
            return minimum_distance(List/Cons (xs.tail.head, (List/Cons (xs.head, xs.tail.tail))))

# Função auxiliar para atualizar as distâncias dos vizinhos
# update_distance (lpf: Data.List (Edge Node)) (lps: Data.List (Data.Pair Data.U60 Data.U60)) (i: Data.U60)
# update.distance (lpf, lps, i) : Data.List (Data.Pair Data.U60 Data.U60)
# update.distance List/Nil lps i = Data.List.reverse lps
# update.distance (List/Cons (Edge t) (Edge.new head tail) tail.tail) lps i =
#     let mind =
#     if (< (+ head i) Maxbound) {
#       (+ head i)}
#     else
#       {Maxbound}
#     update.distance tail.tail ((Data.List.cons (Data.Pair.new tail mind) lps)) i

def update_distance(lpf, lps, i):
  match lpf:
    case List/Nil:
      return (reverse(lps))
    case List/Cons: #lps.head, lps.tail
      match lps:
        case List/Nil:
          return (reverse(lps))
        case List/Cons: 
          (head.fst, head.snd) = lps.head
          (head.tail.fst, head.tail.snd) = lpf.head
          if head.fst == head.tail.fst:
            if head.snd > head.tail.snd + i:
              return update_distance(lpf.tail, update(lps, 0, (head.fst, head.tail.snd + i)), i)
            else:
              return update_distance(lpf.tail, lps, i)
          else:
            return update_distance(lpf.tail, lps, i)



def main() : 
  # return (minimum_distance([(0, 2), (3, 9), (4, 5), (3, 7)]) )
  return(update_distance([(0, 2), (3, 9), (4, 5), (3, 7)], [(0, 0), (1, 3), (2, 4), (3, 3)], 0))
  # return (reverse([0,1,2,3,4,5]))

# função para obter um valor em uma lista
def get_list_value(xs, index):
  match xs:
    case List/Nil:
      return Maybe/None
    case List/Cons:
      switch index:
        case 0:
          return xs.head
        case _:
          return get_list_value(xs.tail, index - 1)


# Função para atualizar um valor em uma lista
def update(xs, index, value):
  if index == 0:
    match xs:
      case List/Nil:
        return List/Cons(value, List/Nil)
      case List/Cons:
        return List/Cons(value, xs.tail)
  else:
    match xs:
      case List/Nil:
        return List/Nil
      case List/Cons:
        return List/Cons(xs.head, update(xs.tail, index - 1, value))


# Função para criar uma lista com um valor repetido
def repeat(n, value):
  if n == 0:
    return List/Nil
  else:
    return List/Cons(value, repeat(n - 1, value))


# Função para obter o comprimento de uma lista
def length(xs):
  match xs:
    case List/Nil:
      return 0
    case List/Cons:
      return 1 + length(xs.tail)

# Função para inverter uma lista
def reverse(xs):
  match xs:
    case List/Nil:
      return List/Nil
    case List/Cons:
      return append(reverse(xs.tail), List/Cons(xs.head, List/Nil))

# Função para concatenar duas listas
def append(xs, ys):
  match xs:
    case List/Nil:
      return ys
    case List/Cons:
      return List/Cons(xs.head, append(xs.tail, ys))
