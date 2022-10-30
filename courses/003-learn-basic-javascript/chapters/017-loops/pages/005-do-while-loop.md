In the `do...while` loop, for the first iteration, the code block is executed without any checks. From the second iteration onwards, the statement of the loop is checked at the beginning of the iteration. If the statement evaluates to `true`, then the code block is run and the loop moves to its next iteration. If the statement evaluates to `false`, then the loop is immediately terminated and no more code is run.

Let's look at the example given below,
where we print the numbers from 1 to 5 using a `do...while` loop.

<Editor lang="javascript">
<code>
let i = 1;
do {
  console.log(i);
  i++;
} while (i < 6);
</code>
</Editor>

Here,
we first initialize a variable `i` with the value of 1. We then start a `do...while` loop, the steps for which are as follows:

**Step 1** - For the first iteration, the code block is run without any checks, wherein we print the value of `i` and increment its value by 1. The loop then moves to its second iteration.

**Step 2** - At the beginning of the second iteration, the statement `i < 6` is checked to see if it evaluates to `true`. Since, the current value of `i` is 2, the statement does evaluate to `true`.

**Step 3** - The code block of the loop is then run, where we print the value of `i` to the console and increment the value of `i` by 1.

**Step 4** - The loop then moves on to the next iteration, wherein it repeats the steps from Step 2.

Steps 2, 3 and 4 are repeated as long as the statement of the `do...while` loop evaluates to `true`. At one point, the value of `i` will be 6 at the beginning of an iteration, due to which the statement `i < 6` will evaluate to `false`. At that point, the loop immediately terminates and no more code is run.

The `do while` is similar to the `while` loop, with the only difference being that in the `do...while` loop, the code block is executed once before checking the condition.
