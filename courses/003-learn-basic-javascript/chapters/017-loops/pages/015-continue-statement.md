`continue` is used to skip an iteration of a loop
by immediately ending the current iteration of the loop,
and
moving to the next iteration.

In the `while` and `do...while` loops,
the `continue` statement ends the execution
of the current iteration
and
the loop immediately moves to the next iteration.

The code given below is used to print
the **even** numbers from `1` to `10`
using a `while` loop.

<Editor lang="javascript">
<code>
let i = 1;
while (i <= 10) {
  i++;
  if (i % 2 == 1) {
    continue;
  }
  console.log(i);
}
</code>
</Editor>

During each iteration,
we check the value of `i` to see if it is odd,
`i % 2 == 1`.
If so, we run a `continue` statement,
which ensures that no further code is run
for this iteration and we move to the next iteration of the loop.

In the `for`, `for...in`
and
`for...of` loops,
the `continue` statement ends
the execution of the current iteration.

<Editor lang="javascript">
<code>
for (let i = 1; i <= 10; i++) {
  if (i % 2 == 0) {
    continue;
  }
  console.log(i);
}
</code>
</Editor>

The code given above is used to print
the **odd** numbers from `1` to `10` using a `for` loop.
