The `break` statement is used to forcefully stop a loop.

Consider the following example, where we run a `for` loop to print the numbers from 1 to 5.

<Editor lang="javascript">
<code>
for (let i = 1; i < 6; i++) {
  console.log(i);
}
</code>
</Editor>

In the same loop, if we want to print values only till 2, then we can use a `break` statement. This will forcefully terminate the `for` loop and prevent any further execution of the code in the loop.

<Editor lang="javascript">
<code>
for (let i = 1; i < 6; i++) {
  if (i == 3) {
    break;
  }
  console.log(i);
}
</code>
</Editor>