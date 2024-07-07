JavaScript puts variable
and
function declarations into memory
before execution of any code block.
Therefore, we can access the variables
and
functions even before their declaration.
This is called **Hoisting**.

Let's try printing the value of a variable before declaring it.

<codeblock language="javascript" type="lesson">
<code>
console.log(num);
var num = 1;
</code>
</codeblock>

In the example given above,
we are trying to print the value of `num`
before declaring it using `var`.
We get `undefined` in the output, not an error.
This is because of the hoisting of the declaration of `num`.

It is important to note that only declarations are hoisted.
Initializations are not hoisted.
Hence, the above code executes as shown below:

<codeblock language="javascript" type="lesson">
<code>
var num; // Declaration is hoisted to the top

console.log(num);
num = 1;
</code>
</codeblock>

Similarly, function declarations
are also hoisted to the top.
This allows us to use functions
even before they are declared.

<codeblock language="javascript" type="lesson">
<code>
sum(1, 2);

function sum(first, second) {
  console.log(first + second);
}
</code>
</codeblock>

The variables declared using `let`
and
`const` are also hoisted without initialization.
But when we try to access such variables
before declaration it throws an error.
This is because such variables
can't be accessed before initialization.

In the example given below,
trying to print the value of `num`
before declaring it with `let` results in an error.

<codeblock language="javascript" type="lesson">
<code>
console.log(num);
let num = 1;
</code>
</codeblock>

Similarly, trying to print the value of `num`
before declaring it with `const` results in an error
in the example given below.

<codeblock language="javascript" type="lesson">
<code>
console.log(num);
const num = 1;
</code>
</codeblock>