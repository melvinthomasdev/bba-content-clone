`setTimeout()` can be used to run a function after a certain time delay.
It sets a timer and executes a function once that timer is complete.

A basic `setTimeout()` method takes two parameters:

1. The **function** that needs to be run
2. The **time delay** in milliseconds

The example given below
prints `Hello, World!` onto
the console after a delay of 2 seconds.

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = () => console.log("Hello, World!");

setTimeout(displayGreeting, 2000);
console.log("Timer started...");
</code>
</codeblock>

In the example given above,
we pass 2000 for the time delay argument.
This is because `2 seconds` is equal to `2000 milliseconds`.

The first argument passed to `setTimeout` is a function.
We can only pass the name of the function as argument.
If that function also requires arguments to be passed,
you can pass them by adding them after the first two arguments of the `setTimeout()` method call,
as shown below:

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = (firstName, lastName) =>
  console.log(`Hello, ${firstName} ${lastName}!`);

setTimeout(displayGreeting, 2000, "Oliver", "Smith");
console.log("Timer started...");
</code>
</codeblock>

In the example given above,
the `setTimeout` has the following arguments:

- `displayGreeting` is the function to be executed after the time delay.

- `2000` is the amount of time delay.

- `"Oliver"` and `"Smith"` are arguments to be passed to the `displayGreeting` function.
  So after the time delay, `displayGreeting("Oliver", "Smith")` will be called.

Another way to pass arguments to the function
is shown in the example below.
This method is preferred because
it is cleaner and more readable.

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = (firstName, lastName) =>
  console.log(`Hello, ${firstName} ${lastName}!`);

setTimeout(() => displayGreeting("Oliver", "Smith"), 2000);
console.log("Timer started...");
</code>
</codeblock>

It is also preferred to use named parameters
when there are multiple parameters.

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = ({ firstName, lastName }) =>
  console.log(`Hello, ${firstName} ${lastName}!`);

setTimeout(() => displayGreeting({ firstName: "Oliver", lastName: "Smith" }), 2000);
console.log("Timer started...");
</code>
</codeblock>