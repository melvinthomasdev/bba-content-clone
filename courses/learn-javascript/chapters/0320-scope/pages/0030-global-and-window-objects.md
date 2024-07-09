All variables and functions
with the global scope
are properties of either
the `global` object
or
the `window` object.

If the JavaScript code
is running in a browser,
all global variables and functions
are properties of the `window` object.

JavaScript can also be run on
the terminal of your operating system.
If the JavaScript code is run on a terminal,
all global variables and functions
are properties of the `global` object.

Since all examples in the Academy are
run in a browser window,
all global variables and functions are
properties of the `window` object.

For example, the function `console.log`
that we use to display an output
is a method of the `window` object.

<codeblock language="javascript" type="lesson">
<code>
const count = 7;

console.log(count);

window.console.log(count);
</code>
</codeblock>

In the example given above,
both `console.log`
and
`window.console.log` will be able
to show the output.
But we do not need to explicitly prefix with the
`window.` dot notation to access
variables and functions in the global scope.

Do note that, all global variables
that are declared with the
`const` and `let` keywords
do not become properties of
the `global` or `window` objects.

<codeblock language="javascript" type="lesson">
<code>
const count = 7;
let age = 23;

console.log(window.count);
console.log(window.age);
</code>
</codeblock>

A variable declared without using
the `const` or `let` keywords
becomes a property of
the `global` or `window` objects.

<codeblock language="javascript" type="lesson">
<code>
count = 7;

console.log(count);
console.log(window.count);
</code>
</codeblock>

**However, declaring a variable
without using the `const` or `let` keywords
is a bad practice
and
it should be avoided.**

We can add properties
to the `global` or `window` objects,
using the dot or bracket notations.

<codeblock language="javascript" type="lesson">
<code>
window.count = 100;
window.displayGreeting = () => console.log("Hello World!");

console.log(count);
console.log(window.count);

displayGreeting();
window.displayGreeting();
</code>
</codeblock><codeblock language="javascript" type="lesson">
<code>
window["full name"] = "Oliver Smith";

console.log(window["full name"]);
</code>
</codeblock>

In the example given above,
we added a property `window["full name"]`
to the `window` object.
We can only access this property
using the bracket notation
because `full name` on its own
is not a valid variable name.
