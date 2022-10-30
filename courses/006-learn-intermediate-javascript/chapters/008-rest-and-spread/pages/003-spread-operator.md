The **spread operator**, `...` expands an array
or a string into its elements.
It returns the elements as a list
of parameters that can be passed into a function.

Consider a function `add` which has 3 parameters,
`a`, `b` and `c`:

Using the spread operator,
we can simply pass a single
argument, which is an array
of 3 numbers, instead of
passing 3 separate arguments:

<Editor lang="javascript">
<code>
function add(a, b, c) {
  return a + b + c;
}
let array = [1, 2, 3];

console.log(add(...array));
</code>
</Editor>