`continue` is used to skip
an iteration of a loop
by immediately ending
the current iteration of the loop,
and
moving to the next iteration.

The code given below is used to display
the **even** numbers from `1` to `10`
using a `while` loop.

<codeblock language="javascript" type="lesson">
<code>
let iteration = 1;
while (iteration <= 10) {
  iteration++;
  if (iteration % 2 === 1) {
    continue;
  }
  console.log(iteration);
}
</code>
</codeblock>

During each iteration,
we check the value of `iteration`
to see if it is odd,
using the condition - `iteration % 2 === 1`.
If the condition is `true`,
the `continue` statement is executed,
which ends the current iteration
and
starts the next iteration of the loop.

<codeblock language="javascript" type="lesson">
<code>
for (let iteration = 1; iteration <= 10; iteration++) {
  if (iteration % 2 === 0) {
    continue;
  }
  console.log(iteration);
}
</code>
</codeblock>

The code given above
is used to display
the **odd** numbers
from `1` to `10`
using a `for` loop.
