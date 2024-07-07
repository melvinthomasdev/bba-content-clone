Before the introduction of
the `let` and `const` keywords,
we could only declare variables
using the `var` keyword.
We do not use the `var` keyword
to declare variables anymore.
One of the reasons is because
a `var` variable declared
outside a function block
is globally scoped.

<codeblock language="javascript" type="lesson">
<code>
if (true) {
  var message = "Welcome";
  console.log(message);

  const greeting = "Hello There!";
  console.log(greeting);
};

console.log(message);

console.log(greeting);
</code>
</codeblock>

In the example given above:

- The `message` variable declared
  using the `var` keyword
  is not scoped to the `if` statement block.
  Hence, the `console.log(message)` statement
  outside the `if` statement block
  can access the `message` keyword.

- The `greeting` variable declared
  using the `const` keyword
  is scoped to the `if` statement block.
  Hence, the `console.log(greeting)` statement
  outside the `if` statement block
  cannot access the `greeting` keyword
  and
  we get an error.

We can use IIFE to limit
the scope of variables
declared using the `var` keyword.

<codeblock language="javascript" type="lesson">
<code>
(function(){
  if (true) {
    var message = "Welcome";
    console.log(message);
  };

  console.log(message);
})();

console.log(message);
</code>
</codeblock>

In the example given above,
we are enclosing the `message` variable
within an IIFE.
`message` is now scoped to the IIFE.
Hence the `console.log(message)` statement
outside the IIFE throws an error.

In addition to the above use case,
IIFE can be used to keep
variables declared with
`let` and `const` inaccessible
from outside the IIFE.

<codeblock language="javascript" type="lesson">
<code>
const updateCount = (() => {
  let count = 0;
  return () => {
    count++;
    return count;
  };
})();
console.log(updateCount());
console.log(updateCount());
console.log(updateCount());
console.log(updateCount());
</code>
</codeblock>

In the example given above,
the value of the `count` variable
increments every time the function executes.
The function inside the IIFE
returns the value of the `count` variable.
Only the function that we are returning
from inside the IIFE can access the `count` variable.
