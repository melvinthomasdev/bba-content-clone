Loops are used to run
a piece of code
multiple times.
The code in a loop runs
repeatedly as long as
a certain condition
evaluates to `true`.

Let's look at the example given below,
where we print the numbers
from `1` to `5` using a **for loop**.

<codeblock language="javascript" type="lesson">
<code>
for (let noOfRepeats = 1; noOfRepeats < 6; noOfRepeats++) {
  console.log(noOfRepeats);
}
</code>
</codeblock>

The steps followed while executing
the above `for` loop are as follows:

**Step 1** -
Before execution of the loop,
the first statement,
`let noOfRepeats = 1` is executed.
This creates a variable `noOfRepeats`
and
assigns the value `1` to it.
This step is only executed
once before the loop starts.

**Step 2** -
The loop begins with
the evaluation of the second statement,
i.e., the condition `noOfRepeats < 6`.
The loop will only be executed,
if this condition evaluates to `true`
for each **iteration** of the loop.
Since the value of `noOfRepeats`
is currently `1`,
the condition is `true`
and
the code block
of the loop is executed.

Each time the loop's
code block is executed,
it is known as an **iteration**.
If the code block
gets executed `7` times,
we can say that the loop
**iterated 7 times**.

**Step 3** -
Once the code block is executed,
i.e., an **iteration** is completed,
the third statement, `noOfRepeats++` gets executed.
and
the value of `noOfRepeats`
is incremented by `1`.

**Step 4** -
The loop then moves on
to the next iteration,
wherein it repeats
the steps from `Step 2`.

Steps 2, 3 and 4 are repeated
as long as the condition
in `Step 2` evaluates to `true`.
If the condition evaluates to `false`,
the execution of the loop is stopped.

In the above example, at one point,
the value of `noOfRepeats`
will become `6` at `Step 4`.
Then as the next iteration
starts from `Step 2`,
the condition `noOfRepeats < 6`
would result to `false`
and
the execution of the loop
will be stopped.
