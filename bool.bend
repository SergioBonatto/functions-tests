data bool = true | false

// istrue  = λp  p
// isfalse = λp
//   match p {
//     | true: false
//     | false: true
//   }
//
// and = λp λq
//   match p {
//     | true: q
//     | false: false
//   }
//
// or = λp λq
//   match p {
//     | true: true
//     | false: q
//   }
//
// eql = λp λq
//   match p {
//     | true: q
//     | false: (isfalse q)
//   }
//
// xor = λp λq
//   match p {
//     | true: (isfalse q)
//     | false: q
//   }
//
// nor = λp λq
//   match p {
//     | true: false
//     | false: (not q)
//   }
//
// nand = λp λq
//   match p {
//     | true: (not q)
//     | false: true
//   }
//
// xnor = λp λq
//   match p {
//     | true: q
//     | false: (not q)
//   }

not = λp 
  match p {
    | true: false
    | false: true
  }

neg = λn λb 
  switch n {
  0 : b
  _ : (neg (n-1) (not b))
}

// 2ˆ60
main = (neg 1152921504606846977 true)







  // (and  true false)
  // (or   true false)
  // (xor  true false)
  // (nor  true false)
  // (not  true)
  // (eql  true false)
  // (istrue true)
  // (isfalse true)
  // (nand true true)
  // (xnor true true)

