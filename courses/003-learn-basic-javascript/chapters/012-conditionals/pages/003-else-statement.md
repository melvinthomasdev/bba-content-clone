The `else` statement executes a block of code when the condition in the `if` statement is `false`. It is used along with the `if` statement. 

In the example given below,
the condition in the `if` statement evaluates to `false`. Therefore, the code inside the `else` block executes.

<Editor lang="javascript">
<code>
let x = 7;

if (x % 2 == 0) {
  console.log("x is even");
} else {
  console.log("x is odd");
}
</code>
</Editor>
If you change the value of `x` to `8`, the output changes to `x is even`.