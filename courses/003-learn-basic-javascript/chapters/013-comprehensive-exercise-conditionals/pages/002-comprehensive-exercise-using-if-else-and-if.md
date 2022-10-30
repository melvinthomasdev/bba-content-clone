Follow the steps given below
to write a program:

1. Create a variable `iceCreamPrice`
and
store the value `91`.

2. Create an `if` statement
with the condition that `iceCreamPrice`
should be less than `9`.

3. Use `console.log()` to display the message
`You can afford one more!` when the
condition in the `if` statement becomes `true`.

4. Use the `else...if` statement
to check if `iceCreamPrice`
is less than `99`.

5. Use `console.log()` to display the message
`Your ice cream is fairly expensive!` when the
condition in the `else...if` statement becomes `true`.

6. Use the `else` statement
to display the message
`You bought an unusual dessert!`
when the other conditions are `false`.

<Editor lang="javascript" type="exercise">
<code>
// Write your code here.
</code>

<solution>
let iceCreamPrice = 91;
if (iceCreamPrice < 9) {
  console.log("You can afford one more!");
} else if (iceCreamPrice < 99) {
  console.log("Your ice cream is fairly expensive!");
} else {
  console.log("You bought an unusual dessert!")
}
</solution>
</Editor>