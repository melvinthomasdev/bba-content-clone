`clearTimeout()` can be used to
cancel the a previously created
`setTimeout()` method.

In the example given below,
the timeout is cancelled before
3 seconds have passed.
Hence, the function passed to
the `setTimeout()` method is never run
and
the message is not displayed.

If we remove the `clearTimeout` method,
then the function runs
normally after a delay of 3 seconds.

<Editor lang="javascript">
<code>
function sayHello() {
  console.log("Hello, World!");
}

let identifier = setTimeout(sayHello, 3000);
clearTimeout(identifier);
</code>
</Editor>

As can be seen from the example given above,
the `clearTimeout` method takes
only one parameter: the **identifier value**
returned when calling the `setTimeout()` method.
This is a value used to identify the setTimeout
function.
