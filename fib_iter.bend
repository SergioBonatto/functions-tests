def fib_iterative(n):
  bend a=0, b=1, n:
    when n != 0:
      return fork(b, a + b, n - 1)
    else:
      return a


def main():
  return fib_iterative(10)
