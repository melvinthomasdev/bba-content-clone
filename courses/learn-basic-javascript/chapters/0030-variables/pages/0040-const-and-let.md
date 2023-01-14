In the previous chapters of this section,
we declared variables using
the `const` keyword.
`const` is short for **"constant"**.
It is used to declare a variable
whose value is not intended to
be changed at all,
once it is declared.

If we try to change
the value of a variable
declared using the `const` keyword,
we will get an error.

<codeblock language="javascript" type="lesson">
<code>
const speed = 40;
console.log(speed);

speed = 56;
console.log(speed);
</code>
</codeblock>

We should use `const` by default
to declare all variables.
However, if we know that
the value of the variable
needs to be changed later,
we need to declare the variable
using the `let` keyword.

<codeblock language="javascript" type="lesson">
<code>
let speed = 40;
console.log(speed);
</code>
</codeblock>

In the above example,
we declared a variable `speed`
using the `let` keyword
and
assigned the value `40` to it.

When declaring a variable
using the `const` keyword,
we must always assign it a value.

<codeblock language="javascript" type="lesson">
<code>
const speed = 40;
console.log(speed);

const length; // This will cause an error
console.log(length);
</code>
</codeblock>

We can change the value
of a variable declared using `let`,
using the `=` operator.

<codeblock language="javascript" type="lesson">
<code>
let speed = 40;
console.log(speed);

speed = 56;
console.log(speed);
</code>
</codeblock>

In the above example:

- When we declared the variable `speed`
  we assigned the value `40` to it.

- Then we change the value of `speed`
  with the statement `speed = 56`.
  After that, the value of `speed` is `56`.

When declaring a variable
using the `let` keyword,
it is not necessary
to assign it a value.
We can assign a value to `let`
after it is declared.

<codeblock language="javascript" type="lesson">
<code>
let length;
length = 123;
console.log(length);
</code>
</codeblock>

It is important to note that,
until a value is assigned
to the variable declared using `let`,
it will contain the value `undefined`.

<codeblock language="javascript" type="lesson">
<code>
let length;
console.log(length);

length = 123;
console.log(length);
</code>
</codeblock>

We will learn more about `undefined`
in another section.
