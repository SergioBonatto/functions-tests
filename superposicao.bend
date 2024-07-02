zero =      λz λs z
succ = λn   λz λs (s (n z s))



# Para definir a função de soma para números naturais codificados por Church:
add = λm λn λz λs (m z s (n z s))

zs =    λz λs z
ss = λp λz λs (s p)


main = 
  let church =(add (succ (succ zero)) (succ (succ (succ zero))))
  let scott = (add (ss (ss zs)) (ss (ss (ss zs))))
  scott

