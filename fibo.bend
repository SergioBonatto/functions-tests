# # add = λa λb (+ a b)
#
fib = λx switch x {
  0: 0
  _: let p = x-1; switch p {
    0: 1
    _: (+ (fib p) (fib p-1))
  }
}

main = (fib 4)


# enesimo
# 1 2 3 4 5 6  7  8  9 10 11  12  13  14  15
# 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610

# def fib(n):
#   switch n:
#     case 0:
#       return 1.0000
#     case 1:
#       return 1.0000
#     case _:
#       return fib(n - 1) + fib(n - 2)
#
# def aur(n):
#   fibn = fib(n)
#   fibn1 = fib(n - 1)
#   return (fibn / fibn1)
#
# def main():
#   return aur(30)
