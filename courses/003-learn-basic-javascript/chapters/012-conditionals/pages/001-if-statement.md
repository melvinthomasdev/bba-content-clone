We can use the `if` statement to execute a block of code when the given condition is `true`.

In the example given below, the given condition evaluates to `true`, so the code inside the block executes.

<Editor lang="javascript">
<code>
let x = 1;
let y = 2;

if (x < y) {
  console.log("x is smaller than y");
}
</code>
</Editor>

In the example given below, the given condition evaluates to `false`, and so the code inside the block does not execute. Therefore, there is **no message in the output**. 

<Editor lang="javascript">
<code>
let x = 1;
let y = 2;

if (x > y) {
  console.log("x is greater than y");
}
</code>
</Editor>