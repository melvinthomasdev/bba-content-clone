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
when we access the variable `hello` from
outside the `greetings` function,
it runs into an error.

<Editor lang="javascript">
<code>
function greetings() {
  let hello = "Hello World!"
  console.log(hello);
}
greetings();

console.log(hello); // will cause error
</code>
</Editor>

# Block Scope

A block of code is everything
inside a pair of curly braces `{}`.
A variable is block scoped when
it is declared using either `let` or `const`
and
is enclosed inside a block.
Such variables can only be accessed from
inside those curly braces.

<Editor lang="javascript">
<code>
{
  let name = "Sam";
  const number = 1;
  console.log(name);
}

console.log(number); // will cause an error
</code>
</Editor>

In the example given above,
`name` and `number` are the two variables
declared inside a block.
Therefore, they cannot be accessed
from outside the block.
Hence, when we try to access
the value of the `number`
variable from outside the block,
it runs into an error.

However, variables declared using `var`
are either function-scoped or global-scoped.
They are not block scoped.

<Editor lang="javascript">
<code>
{
  var num = 123;
}
console.log(num);
</code>
</Editor>

In the example given above,
since `var` is not block scoped
the `num` variable can be accessed globally.