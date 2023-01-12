Follow the steps given below
to write a program:

1. Create a variable `iceCreamPrice`
   and assign the number `91` to it.

2. Using `if`, `else if` and `else`,
   for the condition given
   in the first column,
   display the message
   given in the second column
   using `console.log()`.

| Condition                                             | Message                               |
| ----------------------------------------------------- | ------------------------------------- |
| For value of `iceCreamPrice` less than `9`            | "You can afford one more!"            |
| For any other value of `iceCreamPrice` less than `99` | "Your ice cream is fairly expensive!" |
| All other prices                                      | "You bought an unusual dessert!"      |

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here.
</code>

<solution>
const iceCreamPrice = 91;
if (iceCreamPrice < 9) {
  console.log("You can afford one more!");
} else if (iceCreamPrice < 99) {
  console.log("Your ice cream is fairly expensive!");
} else {
  console.log("You bought an unusual dessert!")
}
</solution>
</codeblock>