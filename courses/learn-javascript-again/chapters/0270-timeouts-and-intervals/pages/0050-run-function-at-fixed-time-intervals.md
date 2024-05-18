The `setInterval` method can be used to
repeatedly run a function at
fixed time interval.

A basic `setInterval` method has two parameters:

1. The **function** that needs to be run

2. The **time delay** in milliseconds

The example given below
prints "Hello, World!" on
the console after every
5 seconds.

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = () => console.log("Hello, World!");
setInterval(displayGreeting, 5000);
</code>
</codeblock>

You can also pass arguments to the function,
by adding them after the first
two parameters of `setInterval`.

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = (firstName, lastName) =>
  console.log(`Hello, ${firstName} ${lastName}!`);

setInterval(displayGreeting, 5000, "Oliver", "Smith");
</code>
</codeblock>

Similar to the preferred way
of passing parameters
discussed in the chapter introducing `setTimeout`,
let's use a different way of
passing parameters.

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = ({ firstName, lastName }) =>
  console.log(`Hello, ${firstName} ${lastName}!`);

setInterval(() => displayGreeting({ firstName: "Oliver", lastName: "Smith" }), 5000);
</code>
</codeblock>

The `setInterval` method is very
similar to the `setTimeout` method,
with the only difference being that
`setTimeout` runs the function only
**once** after the time delay,
while `setInterval` runs the
function **repeatedly** after a
specified time interval.
