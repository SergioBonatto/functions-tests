function neg(n, b) {
  if (n == 0) {
    return b
  } else {
    return neg(n-1, !b)
  }
}


// function neg(n, b) {
//   while (n > 0) {
//     b = !b;
//     n--;
//   }
//   return b;
// }

// 2^32 = 4294967296
console.log(neg(4294967296, true)) 
