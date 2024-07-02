type Maybe:
  None
  Some {value} 

def dijkstra_update_neighbors(graph, neighbors, current_index, dist, visited, prev, num_nodes):
  match neighbors:
    case List/Nil:
      return (dist, prev)
    case List/Cons:
      match neighbors.head:
        case (neighbor, cost):
          current_dist = get_map_value(dist, current_index)
          neighbor_dist = get_map_value(dist, neighbor)
          
          if current_dist + cost < neighbor_dist:
            dist = update_map(dist, neighbor, current_dist + cost)
            prev = update_map(prev, neighbor, Maybe/Some(current_index))
          
          return dijkstra_update_neighbors(graph, neighbors.tail, current_index, dist, visited, prev, num_nodes)


def dijkstra(graph, start_node, num_nodes):
  dist = repeat(num_nodes, Maybe/None)
  visited = repeat(num_nodes, False)
  prev = repeat(num_nodes, Maybe/None)

  dist = update_map(dist, start_node, 0)

  return dijkstra_aux(graph, dist, visited, prev, num_nodes)

def dijkstra_aux(graph, dist, visited, prev, num_nodes):
  current_index = get_min_index(dist, visited, num_nodes)
  if current_index == -1:
    return (dist, prev)

  visited = update_map(visited, current_index, True)
  neighbors = get_map_value(graph, current_index)
  if neighbors == Maybe/None:
    return dijkstra_aux(graph, dist, visited, prev, num_nodes)
  else:
    return dijkstra_update_neighbors(graph, neighbors, current_index, dist, visited, prev, num_nodes)

def get_min_index(dist, visited, num_nodes):
  return get_min_index_aux(dist, visited, 0, -1, Maybe/None)

def get_min_index_aux(dist, visited, current_index, min_index, min_value):
  match dist:
    case List/Nil:
      return min_index
    case List/Cons:
      match visited:
        case List/Nil:
          return min_index
        case List/Cons:
          if not visited.head:
            if min_value == Maybe/None or dist.head < min_value:
              return get_min_index_aux(dist.tail, visited.tail, current_index + 1, current_index, dist.head)
            else:
              return get_min_index_aux(dist.tail, visited.tail, current_index + 1, min_index, min_value)
          else:
            return get_min_index_aux(dist.tail, visited.tail, current_index + 1, min_index, min_value)

def get_map_value(map, key):
  match map:
    case Map/Nil:
      return Maybe/None
    case Map/Node:
      if key == map.key:
        return map.value
      elif key < map.key:
        return get_map_value(map.left, key)
      else:
        return get_map_value(map.right, key)

def update_map(map, key, value):
  match map:
    case Map/Nil:
      return Map/Node(key, value, Map/Nil, Map/Nil)
    case Map/Node:
      if key == map.key:
        return Map/Node(key, value, map.left, map.right)
      elif key < map.key:
        return Map/Node(map.key, map.value, update_map(map.left, key, value), map.right)
      else:
        return Map/Node(map.key, map.value, map.left, update_map(map.right, key, value))









# # Função principal de Dijkstra
# def dijkstra(graph, start):
#   num_nodes = length(graph)
#   dist = repeat(num_nodes, 1000000)  # Inicializa distâncias com um valor grande
#   dist = update(dist, start, 0)  # A distância ao nó inicial é 0
#   visited = repeat(num_nodes, 0)  # Inicializa todos os nós como não visitados
#   prev = repeat(num_nodes, Maybe/None)  # Inicializa a lista de antecessores
#
#   return dijkstra_aux(graph, dist, visited, prev, num_nodes)
#
# def dijkstra_aux(graph, dist, visited, prev, num_nodes):
#   if all_visited(visited):
#     return (dist, prev)
#   else:
#     current_index = get_min_index(dist, visited)
#     if current_index == Maybe/None:
#       return (dist, prev)
#     else:
#       visited = update(visited, current_index, 1)
#       neighbors = get_list_value(graph, current_index)
#
#       match neighbors:
#         case Maybe/None:
#           return dijkstra_aux(graph, dist, visited, prev, num_nodes)
#         case Maybe/Some:
#           return dijkstra_update_neighbors(graph, neighbors.value, current_index, dist, visited, prev, num_nodes)
#
# def dijkstra_update_neighbors(graph, neighbors, current_index, dist, visited, prev, num_nodes):
#   match neighbors:
#     case List/Nil:
#       return dijkstra_aux(graph, dist, visited, prev, num_nodes)
#     case List/Cons:
#       match neighbors.head:
#         case List/Nil:
#           return dijkstra_update_neighbors(graph, neighbors.tail, current_index, dist, visited, prev, num_nodes)
#         case List/Cons:
#           neighbor = neighbors.head.head
#           cost = neighbors.head.tail
#
#           current_dist = get_list_value(dist, current_index)
#           neighbor_dist = get_list_value(dist, neighbor)
#
#           if current_dist + cost < neighbor_dist:
#             dist = update(dist, neighbor, current_dist + cost)
#             prev = update(prev, neighbor, Maybe/Some(current_index))
#             return dijkstra_update_neighbors(graph, neighbors.tail, current_index, dist, visited, prev, num_nodes)
#           else:
#             return dijkstra_update_neighbors(graph, neighbors.tail, current_index, dist, visited, prev, num_nodes)
#
#
# def all_visited(visited):
#   match visited:
#     case List/Nil:
#       return 1
#     case List/Cons:
#       if (not (visited.head)):
#         return 0
#       else:
#         return all_visited(visited.tail)
#
# # Encontra o índice do elemento com a menor distância na lista de distâncias
# def get_min_index(dist, visited):
#   return get_min_index_aux(dist, visited, 0, Maybe/None, Maybe/None)
#
# def get_min_index_aux(dist, visited, current_index, min_index, min_value):
#   match dist:
#     case List/Nil:
#       return min_index
#     case List/Cons:
#       match visited:
#         case List/Nil:
#           return min_index
#         case List/Cons:
#           if (not (visited.head)):
#             if min_value == Maybe/None:
#               return get_min_index_aux(dist.tail, visited.tail, current_index + 1, Maybe/Some(current_index), dist.head)
#             elif dist.head < min_value:
#               return get_min_index_aux(dist.tail, visited.tail, current_index + 1, Maybe/Some(current_index), dist.head)
#             else:
#               return get_min_index_aux(dist.tail, visited.tail, current_index + 1, min_index, min_value)
#           else:
#             return get_min_index_aux(dist.tail, visited.tail, current_index + 1, min_index, min_value)
#
#
# # Função para criar um grafo exemplo
# def create_example_graph():
#   return [
#     [(1, 2), (2, 4)],         # Vértice 0
#     [(2, 1), (3, 7)],         # Vértice 1
#     [(3, 3)],                 # Vértice 2
#     []                        # Vértice 3
#   ]
#
# # Função principal para executar o algoritmo de Dijkstra
# def main():
#   graph = create_example_graph()
#   start = 0
#   return dijkstra(graph, start)
#
#
#
#
# # # Encontra o índice do elemento com a menor distância na lista de distâncias
# # def get_min_index(dist, visited):
# #   return get_min_index_aux(dist, visited, 0, Maybe/None, Maybe/None)
# #
# # def get_min_index_aux(dist, visited, current_index, min_index, min_value):
# #   match dist:
# #     case List/Nil:
# #       return min_index
# #     case List/Cons:
# #       match visited:
# #         case List/Nil:
# #           return min_index
# #         case List/Cons:
# #           if (not (visited.head)):
# #             if min_value == Maybe/None:
# #               return get_min_index_aux(dist.tail, visited.tail, current_index + 1, current_index, dist.head)
# #             elif dist.head < min_value:
# #               return get_min_index_aux(dist.tail, visited.tail, current_index + 1, current_index, dist.head)
# #             else:
# #               return get_min_index_aux(dist.tail, visited.tail, current_index + 1, min_index, min_value)
# #           else:
# #             return get_min_index_aux(dist.tail, visited.tail, current_index + 1, min_index, min_value)
# #
# #
# #
# #
# #       # if (not (visited.head)):
# #       #   if (min_value == Maybe/None):
# #       #     return get_min_index_aux(dist.tail, visited.tail, current_index + 1, current_index, dist.head)
# #       #   elif (dist.head < min_value):
# #       #     return get_min_index_aux(dist.tail, visited.tail, current_index + 1, current_index, dist.head)
# #       #   else:
# #       #     return get_min_index_aux(dist.tail, visited.tail, current_index + 1, min_index, min_value)
# #       # else:
# #       #   return get_min_index_aux(dist.tail, visited.tail, current_index + 1, min_index, min_value)
# #       #
# #
# # def main():
# #   return get_min_index([0, 1, 2, 3, 4], [0, 0, 0, 0, 0])
# #
# #
# #
# #

# Função para obter um valor em uma lista com tratamento de índice negativo
def get_list_value(xs, index):
  if (index < 0):
    return (get_list_value((reverse(xs)), (0 - (index + 1))))
  else:
    match xs:
      case List/Nil:
        return Maybe/None
      case List/Cons:
        switch index:
          case 0:
            return (xs.head)
          case _:
            return get_list_value(xs.tail, index - 1)


# Função para atualizar um valor em uma lista com tratamento de índice negativo
def update(xs, index, value):
  if index < 0:
    return update(reverse(xs), 0 - (index + 1), value)
  elif index == 0:
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

# Função para inverter uma lista de forma eficiente
def reverse(xs):
  return reverse_aux(xs, List/Nil)

def reverse_aux(xs, acc):
  match xs:
    case List/Nil:
      return acc
    case List/Cons:
      return reverse_aux(xs.tail, List/Cons(xs.head, acc))

# Função para criar uma lista com um valor repetido
def repeat(n, value):
  switch n:
    case 0:
      return List/Nil
    case _:
      return List/Cons(value, repeat(n - 1, value))

# Função para obter o comprimento de uma lista
def length(xs):
  match xs:
    case List/Nil:
      return 0
    case List/Cons:
      return 1 + length(xs.tail)

# Função para concatenar duas listas
def append(xs, ys):
  match xs:
    case List/Nil:
      return ys
    case List/Cons:
      return List/Cons(xs.head, append(xs.tail, ys))


def not(x):
  switch x:
    case 0:
      return 1
    case _:
      return 0


# # Função auxiliar para encontrar o vértice com a menor distância
# # Graph.minimum.distance (lp: Data.List (Data.Pair Data.U60 Data.U60)) : (Data.Pair Data.U60 Data.U60)
# def minimum_distance(xs):
#   match xs:
#     case List/Nil:
#       return (0, 0)
#     case List/Cons:
#       match xs.tail:
#         case List/Nil:
#           return xs.head
#         case List/Cons:
#           (head.fst, head.snd) =  xs.head
#           (head.tail.fst, head.tail.snd) = xs.tail.head
#           if head.snd < head.tail.snd:
#             return minimum_distance(List/Cons (xs.head, xs.tail.tail))
#           else:
#             return minimum_distance(List/Cons (xs.tail.head, (List/Cons (xs.head, xs.tail.tail))))
#
# # Função auxiliar para atualizar as distâncias dos vizinhos
# # update_distance (lpf: Data.List (Edge Node)) (lps: Data.List (Data.Pair Data.U60 Data.U60)) (i: Data.U60)
# # update.distance (lpf, lps, i) : Data.List (Data.Pair Data.U60 Data.U60)
# # update.distance List/Nil lps i = Data.List.reverse lps
# # update.distance (List/Cons (Edge t) (Edge.new head tail) tail.tail) lps i =
# #     let mind =
# #     if (< (+ head i) Maxbound) {
# #       (+ head i)}
# #     else
# #       {Maxbound}
# #     update.distance tail.tail ((Data.List.cons (Data.Pair.new tail mind) lps)) i
#
# def update_distance(lpf, lps, i):
#   match lpf:
#     case List/Nil:
#       return (reverse(lps))
#     case List/Cons: #lps.head, lps.tail
#       match lps:
#         case List/Nil:
#           return (reverse(lps))
#         case List/Cons:
#           (head.fst, head.snd) = lps.head
#           (head.tail.fst, head.tail.snd) = lpf.head
#           if head.fst == head.tail.fst:
#             if head.snd > head.tail.snd + i:
#               return update_distance(lpf.tail, update(lps, 0, (head.fst, head.tail.snd + i)), i)
#             else:
#               return update_distance(lpf.tail, lps, i)
#           else:
#             return update_distance(lpf.tail, lps, i)
#
#
#
# def main() :
#   # return (minimum_distance([(0, 2), (3, 9), (4, 5), (3, 7)]) )
#   # return(update_distance([(0, 2), (3, 9), (4, 5), (3, 7)], [(0, 0), (1, 3), (2, 4), (3, 3)], 0))
#   return (get_list_value ((update([1, 2, 3, 4, 5], 2, 10)), -2))
#   # return (reverse([0,1,2,3,4,5]))
#
