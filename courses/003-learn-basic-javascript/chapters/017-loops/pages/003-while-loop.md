The `while` loop contains a statement,
which is checked at the beginning of
each iteration of the loop.
If the statement evaluates to `true`,
then the code block runs
and
the loop moves to its next iteration.
If the statement evaluates to `false`,
then the loop terminates immediately
and
no more code is run.

Let's look at the example given below,
where we print the numbers from 1 to 5
using a `while` loop.

<Editor lang="javascript">
<code>
let i = 1;
while (i < 6) {
  console.log(i);
  i++;
}
</code>
</Editor>

Here,
we first initialize a variable `i`
with the value of 1.
We then start a `while` loop,
the steps for which are as follows:

**Step 1** -
At the beginning of the first iteration,
the statement, `i < 6` is checked
to see if it evaluates to `true`.
Since the current value of `i` is 1,
the statement does evaluate to `true`.

**Step 2** -
The code block of the loop is then run,
where we print the value of `i` to the console
and
increment the value of `i` by 1.

**Step 3** -
The loop then moves on to the next iteration,
wherein it repeats the steps from Step 1.

Steps 1, 2 and 3 are repeated
as long as the statement of
the `while` loop evaluates to `true`.
At one point, the value of `i` will be 6
at the beginning of an iteration,
due to which the statement,
`i < 6` will evaluate to `false`.
At that point, the loop
immediately terminates
and
no more code is run.
