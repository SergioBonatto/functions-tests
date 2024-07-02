def foo(x):
  return print(x)


def bar(xs):
  match xs:
    case List/Nil:
      return " "
    case List/Cons:
      match xs.tail:
        case List/Nil:
          return xs.head
        case List/Cons:
          # print(xs.head)
          return bar(xs.tail)

def main():
  # return bar([1,2,3,4])
  return print("hello word")
