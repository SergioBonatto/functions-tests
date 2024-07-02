function mul(a, b) {
  if (a === 0 || b === 0) {
    return 0;
  }
  if (b < 0) {
    return -a + mul(a, b + 1);
  }
  return a + mul(a, b - 1);
}

console.log(mul(0, 0));


