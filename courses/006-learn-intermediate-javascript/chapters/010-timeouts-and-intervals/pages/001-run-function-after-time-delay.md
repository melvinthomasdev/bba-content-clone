`setTimeout()` can be used to run a function after a certain time delay.

A basic `setTimeout()` method takes two parameters:

1. The **function** that needs to be run
2. The **time delay** in milliseconds

The example given below
prints `Hello, World!` onto
the console after a delay of 2 seconds.

<Editor lang="javascript">
<code>
function sayHello() {
  console.log("Hello, World!");
}

setTimeout(sayHello, 2000);
</code>
</Editor>

If the function that you are passing to `setTimeout` needs arguments, you can pass them by adding them after the first two parameters of the `setTimeout()` method call as shown below:

<Editor lang="javascript">
<code>
function sayHello(firstName, lastName) {
  console.log("Hello, " + firstName + " " + lastName + "!");
}

setTimeout(sayHello, 2000, "Oliver", "Smith");
</code>
</Editor>

The `setTimeout()` method returns a number value.
This value can be used to cancel the timeout later if needed.