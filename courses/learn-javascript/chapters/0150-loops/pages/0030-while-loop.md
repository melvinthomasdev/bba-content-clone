The **while loop** contains a condition,
which is checked at the beginning of
each iteration of the loop.
If the condition evaluates to `true`,
then the code block is executed
and
then the loop moves to its next iteration.
If the condition evaluates to `false`,
then the execution of the loop is stopped.

Let's look at the example given below,
where we print the numbers from `1` to `5`
using a `while` loop.

<codeblock language="javascript" type="lesson">
<code>
let iteration = 1;
while (iteration < 6) {
  console.log(iteration);
  iteration++;
}
</code>
</codeblock>

Here, we first initialize
a variable `iteration`
with the value `1`.
We then start a `while` loop,
the steps for which are as follows:

**Step 1** -
At the beginning of the first iteration,
the condition `iteration < 6` is evaluated.
Since the current value of `iteration` is `1`,
the condition evaluates to `true`.

**Step 2** -
The code block of the loop is then executed,
where we print the value of `iteration` to the console
and
increment the value of `iteration` by `1`.

**Step 3** -
The loop then moves on to the next iteration,
wherein it repeats the steps from `Step 1`.

These steps are repeated
as long as the condition of
the `while` loop evaluates to `true`.
At one point,
the value of `iteration` will become `6`
at the beginning of an iteration,
due to which the condition
`iteration < 6` will evaluate to `false`.
At that point, the execution
of the loop is stopped.
