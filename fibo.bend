# # add = λa λb (+ a b)
#
# fib = λx switch x {
#   0: 1
#   _: let p = x-1; switch p {
#     0: 1
#     _: (+ (fib p) (fib p-1))
#   }
# }
#
# main = (fib 30)

def fib(n):
  switch n:
    case 0:
      return 1
    case 1:
      return 1
    case _:
      return fib(n - 1) + fib(n - 2)

def main():
  return fib(30)
