Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const calculateSum = (number1, number2, number3, number4) => {
  return number1 + number2 + number3 + number4;
}

const totalMarks = calculateSum(81, 90, 72, 99);
console.log(totalMarks);
</code>
</codeblock>

In the example given above,
the function `calculateSum` contains
only a single statement
and
that statement is a `return` statement.
In such cases, we can use
a shorthand method of writing arrow functions,
as shown below:

<codeblock language="javascript" type="lesson">
<code>
const calculateSum = (number1, number2, number3, number4) =>
  number1 + number2 + number3 + number4;

const totalMarks = calculateSum(81, 90, 72, 99);
console.log(totalMarks);
</code>
</codeblock>

In the example given above,
the body of the arrow function
is not wrapped in `{}`.
Instead, the function body contains
only the expression,
whose value is to be returned.
When the function is defined in such a manner,
the value evaluated from the statement
following the `=>` operator is returned.

We can also use this
arrow function shorthand
for functions that
do not return any values.

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = () => {
  console.log("Hello World!");
}

displayGreeting();
</code>
</codeblock>

We can rewrite the example given above
to use the arrow function shorthand.

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = () => console.log("Hello World!");

displayGreeting();
</code>
</codeblock>

In the example given above,
the arrow function only has
one statement `console.log("Hello World!")`.
When the function is invoked,
the statement is executed and
the value evaluated from
`console.log("Hello World!")` is returned.
Since that statement does not
evaluate to any value,
`undefined` is returned.
Let's confirm that using the example
given below:

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = () => console.log("Hello World!");

const valueReturned = displayGreeting();
console.log(valueReturned);
</code>
</codeblock>