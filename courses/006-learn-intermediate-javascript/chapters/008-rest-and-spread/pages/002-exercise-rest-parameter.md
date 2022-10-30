In the exercise given below, `add` returns the sum of only the first two arguments passed to it. Any additional arguments are currently being ignored.

Add a rest parameter `c` to the function, so that the function returns the sum of any number of arguments passed to it.

<Editor type="exercise" lang="javascript">
<code>
function add(a, b) {
  let sum = a + b;
  return sum;
}

console.log(add(1, 2, 3, 4));
</code>

<solution>
function add(a, b, ...c) {
  let sum = a + b;
  for (let i = 0; i < c.length; i++) {
    sum += c[i];
  }
  return sum;
}

console.log(add(1, 2, 3, 4));
</solution>
</Editor>