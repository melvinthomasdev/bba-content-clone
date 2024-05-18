The `else` statement is used
along with the `if` statement.
The `else` statement executes
a block of code when
the condition in the `if`
statement results in `false`.

In the example given below,
the condition in the `if` statement
`number % 2 === 0` evaluates to `false`.
Therefore, the code inside
the `else` block gets executed.

<codeblock language="javascript" type="lesson">
<code>
const number = 7;

if (number % 2 === 0) {
  console.log("number is even");
} else {
  console.log("number is odd");
}
</code>
</codeblock>
If you change the value
of `number` to `8`,
the output changes to
`"number is even"`.
