Loops are used to run the same piece of code multiple times. The code in a loop runs repeatedly as long as a certain condition evaluates to `true`.

Let's look at the example given below,
where we print the numbers from 1 to 5 using a `for` loop.

<Editor lang="javascript">
<code>
for (let i = 1; i < 6; i++) {
  console.log(i);
}
</code>
</Editor>

The steps followed while executing the above `for` loop are as follows:

**Step 1** - At the beginning of the loop, the first statement, `let i = 1` executes, which creates a variable `i` and gives it a value of 1.

**Step 2** - The loop then moves on to its first iteration. Here, the second statement, `i < 6` is checked to see if it evaluates to `true`. Since the value of `i` is currently 1, the second statement is indeed `true`. The code block of the loop is then run.

**Step 3** - The third statement, `i++` finally executes at the end of this iteration, when everything inside the code block has been executed. Here, we increment the value of `i` by 1.

**Step 4** - The loop then moves on to the next iteration, wherein it repeats the steps from Step 2.

Steps 2, 3 and 4 are repeated as long as the second statement evaluates to `true`. At one point, the value of `i` will be 6 at the beginning of an iteration, due to which the second statement,`i < 6` will evaluate to `false`. At that point, the loop immediately terminates and no more code is run.

It's important to understand that the loop will keep on going as long the condition `i < 6` is `true`. The loop terminates only when the condition `i < 6` is `false`.