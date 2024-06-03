# Map-Reduce = simple divide-and-conquer!
def map_red(d, i, map, red):
  switch d:
    case 0:
      return map(i)
    case _:
      lft = map_red(d-1, i*2+0, map, red)
      rgt = map_red(d-1, i*2+1, map, red)
      return red(lft, rgt)

# Reduces 67 million data-points
def main:
  map = lambda idx: idx * 777
  red = lambda x y: x * y + 1
  return map_red(24, 0, map, red)
