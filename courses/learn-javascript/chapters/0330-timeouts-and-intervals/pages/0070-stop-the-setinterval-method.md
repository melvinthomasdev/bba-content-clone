The function specified in the `setInterval`
method keeps on running in a loop,
unless we stop it.
We can do this with the help of the `clearInterval` method.
The `setInterval` method returns a number value
that can be used to identify the timer set by the method.
The `clearInterval` method takes only one parameter,
the **identifier value** returned by the `setInterval` call
that set the timer to be cancelled.

<codeblock language="javascript" type="lesson">
<code>
const displayGreeting = () => console.log("Hello, World!");
const timerID = setInterval(displayGreeting, 3000);
clearInterval(timerID);
</code>
</codeblock>

In the example given above,
the function `displayGreeting` is
not run because `clearInterval`
method cancels the timer started
by `setInterval`.
