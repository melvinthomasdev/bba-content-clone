In the **do...while loop**,
the code block is executed
without any checks at the beginning.
The loop condition is checked
after the code block is executed.
If the condition evaluates to `true`,
the loop moves to its next iteration.
If the condition evaluates to `false`,
then the execution of the loop is stopped.

Let's look at the example given below,
where we print the numbers from `1` to `5`
using a **do...while loop**.

<codeblock language="javascript" type="lesson">
<code>
let iteration = 1;
do {
  console.log(iteration);
  iteration++;
} while (iteration < 6);
</code>
</codeblock>

Here, we first initialize
a variable `iteration`
with the value `1`.
We then start a `do...while` loop,
the steps for which are as follows:

**Step 1** -
The code block is executed
without any checks at the beginning.
The value of `iteration` is displayed
and
its value is incremented by `1`.

**Step 2** -
At the end of the iteration,
the condition `iteration < 6` is evaluated.
Since, the current value of `iteration` is `2`,
the condition evaluates to `true`
and
the loop moves to the next iteration,
wherein it repeats the steps from `Step 1`.

These steps are repeated
as long as the condition
of the `do...while` loop
evaluates to `true`.
In the above example, at one point,
the value of `iteration` will become `6`,
due to which the condition
`iteration < 6` will evaluate to `false`
and
the execution of the loop
will be stopped.

The **do...while loop** is
similar to the **while loop**,
with the only difference being that
in the **do...while loop**,
the loop condition is checked
at end of an iteration,
whereas
in the **while loop**,
the loop condition is checked
at the start of an iteration.
Due to this behavior,
the code block in a **do...while loop**
is executed at least once,
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
let iteration = 1;

while (iteration < 1) {
  console.log("while Loop");
  iteration++;
};

iteration = 1;

do {
  console.log("do...while loop");
  iteration++;
} while (iteration < 1);
</code>
</codeblock>

In the example above,
we use both `while`
and
`do..while` loops.
Both loops have the same condition
and
have the value of `iteration` as `1`
before the beginning of each loops.
However, we only get the output
from the `do...while` loop.
This is because,
the condition `iteration < 1`,
evaluates to `false` from the first iteration.

In the `while` loop,
since the condition is checked
before the first iteration,
the execution of the loop was stopped
even before the first iteration.

In the `do...while` loop,
the condition is checked
after the first iteration is complete.
Hence execution of the loop was stopped
after the first iteration
and
**"do...while loop"**
is displayed at least once.
