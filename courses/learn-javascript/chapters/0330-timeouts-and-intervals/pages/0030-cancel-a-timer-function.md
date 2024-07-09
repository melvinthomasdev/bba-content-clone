`clearTimeout()` can be used to cancel
a timer created using the `setTimeout()` method.

The `setTimeout()` method returns a number value
or its identifier value.
The `clearTimeout()` method accepts only that value as argument.

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = () => console.log("Hello, World!");

const timeoutID = setTimeout(displayGreeting, 3000);
console.log("Timer started...");
console.log(`ID of the timer is ${timeoutID}`);

clearTimeout(timeoutID);
</code>
</codeblock>

In the example given above,
the timeout is cancelled before
3 seconds have passed.
Hence, the function passed to
the `setTimeout()` method is never run
and
the message is not displayed.

If we remove the `clearTimeout` method,
then the function runs
normally after a delay of 3 seconds.
