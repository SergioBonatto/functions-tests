def to_list(str):
  match str:
    case String/Nil:
      return []
    case String/Cons:
      cond = is_digit(str.head)
      switch cond:
        case 0:
          return to_list(str.tail)
        case _:
          return List/Cons(char_to_int(str.head), to_list(str.tail))

def char_to_int(char):
  return (char - 48)

# def map(f, list):
#   match list:
#     case List/Cons:
#       return List/Cons(f(list.head), map(f, list.tail))
#     case List/Nil:
#       return List/Nil

def is_digit(char):
  return char > 47 & char < 58

def nine_numbers(list, n):
  switch n:
    case 0:
      return []
    case _:
      match list:
        case List/Nil:
          return []
        case List/Cons:
          return List/Cons(list.head, nine_numbers(list.tail, n - 1))

def fst_digit_validator(list, n):
  match list:
    case List/Nil:
      return []
    case List/Cons:
      return List/Cons((list.head * n), fst_digit_validator(list.tail, n - 1))

def sum_list(list):
  match list:
    case List/Nil:
      return 0
    case List/Cons:
      return list.head + sum_list(list.tail)

def mod(n):
  return n % 11

def length(list):
  match list:
    case List/Nil:
      return 0
    case List/Cons:
      return 1 + length(list.tail)

def append(xs, x):
  match xs:
    case List/Nil:
      return List/Cons(x, List/Nil)
    case List/Cons:
      return List/Cons (xs.head, append(xs.tail, x))


def take(n, list):
  match list:
    case List/Nil:
      return []
    case List/Cons:
      switch n:
        case 0:
          return []
        case 1:
          return list.head
        case _:
          return take((n - 1), list.tail)

def calculate_first_digit(cpf_lst):
  nine_first_digits = nine_numbers(cpf_lst, 9)
  products  = fst_digit_validator(nine_first_digits, 10)
  summation = sum_list(products)
  remainder = mod(summation)
  if (remainder < 2):
    return 0
  else:
    return (11 - remainder)

def calculate_second_digit(cpf_lst, first_digit):
  ten_first_digits = append (nine_numbers(cpf_lst, 9), first_digit)
  products = fst_digit_validator(ten_first_digits, 11)
  # summation = sum_list(products)
  # remainder = mod(summation)
  # if remainder < 2:
    # return 0
  # else:
    # return 11 - remainder
  return "false`"

def validate_cpf(cpf):
  cpf_lst = to_list(cpf)
  if length(cpf_lst) != 11:
    return "CPF inválido."
  else:
    first_digit = calculate_first_digit(cpf_lst)
    second_digit = calculate_second_digit(cpf_lst, first_digit)
    cond1 = (take(9, cpf_lst) == first_digit)
    cond2 = (take(10, cpf_lst) == second_digit)
    cond3 = and_(cond1, cond2)
    if cond3:
      return "CPF válido."
    else:
      return "CPF inválido."
        
def and_(a, b):
  switch a:
    case 0:
      return b
    case _:
      return 1


list  = "123.456.789-00"

def main():
  # return to_list(list)
  # return map(char_to_int, to_list(list))
  # return is_digit('-')
  # return mod(sum_list(fst_digit_validator(nine_numbers(to_list(list), 9), 10)))
  # return validate_cpf(list)
  # return take(5, to_list(cpf))
  return calculate_second_digit(to_list(list))


# [49, 50, 51, 52, 53]
# [ 1,  2,  3,  4,  5]
