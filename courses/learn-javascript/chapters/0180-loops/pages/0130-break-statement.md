We have seen how
the `break` statement
can be used to stop the
execution of a code block
in a **switch case**.
Now let's see how
the `break` statement can be
used to forcefully stop a loop.

Consider the following example,
where we run a `for` loop to
print the numbers from `1` to `5`.

<codeblock language="javascript" type="lesson">
<code>
for (let iteration = 1; iteration < 6; iteration++) {
  console.log(iteration);
}
</code>
</codeblock>

If we want to stop
the above loop
after displaying `2`,
from within the loop's code block,
then we can use a `break` statement.
This will forcefully terminate the `for` loop
and prevent any further
execution of the code in the loop.

<codeblock language="javascript" type="lesson">
<code>
for (let iteration = 1; iteration < 6; iteration++) {
  if (iteration === 3) {
    break;
  }
  console.log(iteration);
}
</code>
</codeblock>

In the example given above,
the iterations where
the value of `iteration` is `1` and `2`,
are executed since
the condition `iteration === 3`
evaluates to `false` for those iterations.
Once the value of `iteration` becomes `3`,
the condition `iteration === 3`
evaluates to `true` and
the `break` statement is executed.
Hence the loop is immediately terminated.

We can also use the `break` statement
to end the execution of any of the loops
we have seen so far.
