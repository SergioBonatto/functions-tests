def exp2(n):
  switch n:
    case 0:
      return 1
    case _:
      return exp2(n-1) + exp2(n-1)

def exp2p(n):
  bend x = 0:
    when x < n:
      lft = fork(x + 1)
      rgt = fork(x + 1)
      y = lft + rgt
    else:
      y = 1
  return y

Exp2h n =
  (bend x = 0 {
    when (< x n):(
      let lft = (fork (+ x 1)) 
      let rgt = (fork (+ x 1))
      let y = (+ lft rgt)
      y)
    else:
      let y = 1
      y
  })

Exp2l = λn (
  bend x = 0 {
    when (< x n):(
      let lft = (fork (+ x 1)) 
      let rgt = (fork (+ x 1))
      let y = (+ lft rgt)
      y)
    else:
      let y = 1
      y
  })


def main():
  n = 10
  return [(exp2(n)),(exp2p(n)), (Exp2h(n)), (Exp2l(n))]

