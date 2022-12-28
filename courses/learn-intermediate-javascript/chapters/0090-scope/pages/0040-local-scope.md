A variable declared using `let` and `const`,
inside a function or a code block `{...}`
belongs to the **local scope** of that function or block.
We can only access them from inside
that function or code block.
Such variables are called **local variables**.

**Function scope** and **block scope** are
the two types of local scopes in JavaScript.

# Function Scope

A variable declared inside a function
belongs to the local scope of that function.
We can only access it from inside that function
or any inner functions.
This is known as **function scope**.

In the example given below,
when we access the variable `greetingString` from
outside the `displayGreeting` function,
it runs into an error.

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = () => {
  const greetingString = "Hello World!"
  console.log(greetingString);
}
displayGreeting();

console.log(greetingString); // will cause error
</code>
</codeblock>

# Block Scope

A block of code is everything
inside a pair of curly braces `{}`.
A variable is block scoped when
it is declared using either `let` or `const`
and
is enclosed inside a block.
Such variables can only be accessed from
inside those curly braces.

<codeblock language="javascript" type="lesson">
<code>
const age = 29;

if (age >= 18) {
  let firstName = "Sam";
  const experience = 1;
  console.log(firstName);
  console.log(experience);
}

console.log(firstName); // will cause an error
console.log(experience); // will cause an error
</code>
</codeblock>

In the example given above,
`firstName` and `experience` are the two variables
declared inside a block.
Therefore, they cannot be accessed
from outside the block.
Hence, when we try to access
the value of the `firstName` or `experience`
variable from outside the block,
it runs into an error.
