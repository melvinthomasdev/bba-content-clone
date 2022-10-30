We can use the `if...else` statement
to execute different blocks of code
based on a given condition.

In the example given below,
the output varies depending
on the value stored in the variable `x`.

<Editor lang="javascript">
<code>
let x = 4;

if (x % 2 == 0){
  console.log("even");
} else {
  console.log("odd");
}
</code>
</Editor>

We can also use the **Ternary operator** `?`
to do show the same output using only
**three** lines of code.
The `if...else` in the example given above
requires **six** lines of code
to do the same.

In the example given below,
when the condition at the left of `?` is `true`,
we get `even` in the output.
But when the condition is `false`,
we get `odd` in the output.

<Editor lang="javascript">
<code>
let x = 4;
let result = (x % 2 == 0) ? "even" : "odd";

console.log(result);
</code>
</Editor>

The Ternary operator
requires fewer lines of code,
making it easy to write.
The reduced lines of code also
make it easy to read and comprehend.