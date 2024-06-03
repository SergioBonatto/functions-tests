// 0 == false
// 1 == true
data Bool= false | true



Isbig = λn
  switch n {
    0: Bool/false
    _: Bool/true
  }

// Função para obter o dígito máximo para o radix sort
MaxDigit = λxs
  match xs {
    List/nil: 0
    List/cons: (Max xs.head (MaxDigit xs.tail))
  }

// Função para obter o dígito máximo entre dois números
Max = λa λb
  let c = (Isbig (> a b))
  match c {
    Bool/true  : a
    Bool/false : b
  }

// Função para contar o número de dígitos
CountDigits = λn
  switch n {
    0: 0
    _: (+ 1 (CountDigits (/ n 10)))
  }

// Função para obter o dígito específico
GetDigit = λn λi
  switch i {
    0: (% n 10)
    _: (GetDigit (/ n 10) (- i 1))
  }

CountingSort.initCount = λcount λi
  // let c = (== i 10)
  switch (== i 10) {
    | 0: count
    | _: (CountingSort.initCount (List/cons 0 count) (+ i 1))
  }

CountingSort.updateCount = λcount λxs λexp
  match xs {
    List/nil: count
    List/cons: (CountingSort.updateCount (CountingSort.incCount count (GetDigit xs.head exp)) xs.tail exp)
  }

CountingSort.incCount = λcount λi
  let c = (== i 0)
  match count {
    List/nil: List/nil
    List/cons: (List/cons (
      switch c {
        | 0: (+ count.head 1)
        | _: count.head
      })  (CountingSort.incCount count.tail (- i 1)))
  }

CountingSort.cumulativeCount = λcount λi
  let c = (== i 10)
  switch c {
    0: count
    _: (CountingSort.cumulativeCount (CountingSort.addCount count i) (+ i 1))
  }

CountingSort.addCount = λcount λi
  let c = (== i 0)
  match count {
    List/nil: List/nil
    List/cons: (List/cons (
      switch c {
        | 0: count.head
        | _: (+ count.head (CountingSort.getCount count (- i 1)))
      })  (CountingSort.addCount count.tail (- i 1)))
  }

CountingSort.getCount = λcount λi
  let c = (== i 0)
  match count {
    List/nil: 0
    List/cons: (
      switch c {
        | 0: count.head
        | _: (CountingSort.getCount count.tail (- i 1))
    })
  }

// // // Função para preencher a lista de saída
// // CountingSort.sortOutput = λoutput λcount λxs λexp λi
// //   switch i {
// //     -1: output
// //     _: let digit = (GetDigit (List/get xs i) exp)
// //        let index = (CountingSort.getCount count digit)
// //        let output = (List/set output index (List/get xs i))
// //        let count = (CountingSort.decrementCount count digit)
// //        (CountingSort.sortOutput output count xs exp (- i 1))
// //   }
//
// // Função para preencher a lista de saída
// CountingSort.sortOutput = λoutput λcount λxs λexp λi
//   switch i {
//     (Length xs): output
//     _: let digit = (GetDigit (List/get xs i) exp)
//        let index = (CountingSort.getCount count digit)
//        let output = (List/set output index (List/get xs i))
//        let count = (CountingSort.decrementCount count digit)
//        (CountingSort.sortOutput output count xs exp (+ i 1))
//   }
// Função auxiliar para verificar a condição de parada
CountingSort.isDone = λi λlength
  let c = (== i length)
  match c {
    true: true
    _: false
  }

// Função auxiliar para preencher a lista de saída
CountingSort.sortOutputHelper = λoutput λcount λxs λexp λi
  let digit = (GetDigit (List/get xs i) exp)
  let index = (CountingSort.getCount count digit)
  let output = (List/set output index (List/get xs i))
  let count = (CountingSort.decrementCount count digit)
  (output, count)

// Função para preencher a lista de saída
CountingSort.sortOutput = λoutput λcount λxs λexp λi
  let result = (CountingSort.sortOutputHelper output count xs exp i)
  match (CountingSort.isDone i (Length xs)) {
    true: output
    false: output //(CountingSort.sortOutput (fst result) (snd result) xs exp (+ i 1))
  }

    // let result = (CountingSort.sortOutputHelper output count xs exp i)

// Função para realizar o counting sort no dígito específico
CountingSort = λxs λexp
  let output = List/nil
  let count = List/nil
  let count = (CountingSort.initCount count 0)
  let count = (CountingSort.updateCount count xs exp)
  let count = (CountingSort.cumulativeCount count 1)
  let output = (CountingSort.sortOutput output count xs exp (- (Length xs) 1))
  output

// Função principal para o Radix Sort
// RadixSort = λxs
  // let m = (MaxDigit xs)
  // RadixSort.sort xs 1 (CountDigits m)

// Função para ordenar os dígitos
// RadixSort.sort = λxs λexp λm
  // switch m {
    // exp: xs
    // _: (RadixSort.sort (CountingSort xs exp) (+ exp 1) m)
  // }


// 19055 = 5
// main = (GetDigit (Random 1000) 1 )
// main = (CountDigits (Random 1000))
// main = ((Random 1000))
// main = (Equal 5 5)
// main = ( (Rnd 10))
// main =  ((CountingSort.getCount 1  2) 3)
main = (== 1 0)




// FIXME: se der algo errado, é o `0`, pois não é possível usar número negativo no Bend e substituí por `0`


CountingSort.sortOutput = λoutput λcount λxs λexp λi
  let c = (Is_positive i)
  match c {
    Bool/false: output
    Bool/true: (CountingSort.sortOutput (CountingSort.insertOutput output count xs exp i) count xs exp (- i 1))
  }

// Utils

// Função para gerar uma lista de números aleatórios
Rnd = λn
  switch n {
    0: List/nil
    _: (List/cons (Random (- 10000 n)) (Rnd (- n 1)))
  }

// Função para gerar um número aleatório
Random = λn
  switch n {
    0: 0
    _: (% (+ (* (Random (- n 1)) 16) 101387) 429453)
  }

Length = λxs
  match xs {
    List/nil: 0
    List/cons: (+ 1 (Length xs.tail))
  }

Is_equal_zero = λn
  switch n {
    0: Bool/true
    _: Bool/false
  }

Is_bigger_than_zero = λn
  switch n {
    0: Bool/false
    _: Bool/true
  }

Bool_and = λa λb
  match a {
    Bool/false: Bool/false
    _: b
  }


Is_positive = λn
  let c = (Is_bigger_than_zero n)
  let d = (Is_equal_zero n)
  let e = (Bool_and c d)
  match e {
    Bool/true: Bool/false
    _: Bool/true
  }
// Função para obter o elemento em um índice específico de uma lista
List/get = λxs λi
  switch i {
    0: (match xs {
      List/nil: 0
      List/cons: xs.head
      })
    _: (match xs {
      List/nil:  List/nil
      List/cons: (List/get xs.tail (- i 1))
      })
  }

// Função para definir o elemento em um índice específico de uma lista
List/set = λxs λi λvalue
  switch i {
    0: (match xs {
      List/nil:   (List/cons value List/nil)
      List/cons:  (List/cons value xs.tail)
      }) 
    _: ( match xs {
      List/nil:  (List/cons 0 (List/set List/nil (- i 1) value))
      List/cons: (List/cons xs.head (List/set xs.tail (- i 1) value))
     })
  }
// CountingSort.decCount = λcount λi
//   match count {
//     List.nil: List.nil
//     List.cons: (List.cons (if (= i 0) (- count.head 1) count.head) (CountingSort.decCount count.tail (- i 1)))
//   }
//
// CountingSort.getElem = λxs λi
//   match xs {
//     List.nil: 0
//     List.cons: (if (= i 0) xs.head (CountingSort.getElem xs.tail (- i 1)))
//   }

// Função principal para o Radix Sort
// RadixSort = λxs
// (  let m = (MaxDigit xs)
//   RadixSort.sort xs 1 (CountDigits m))
//
// RadixSort.sort = λxs λexp λm
//   match exp {
//     m: xs
//     _: (RadixSort.sort (CountingSort xs exp) (+ exp 1) m)
//   }
//
