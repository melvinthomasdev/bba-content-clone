Let's add `setTimeout` to our example:

<codeblock language="javascript" type="lesson">
<code>
const searchOnGoogle = () => 
  setTimeout(() => console.log(`Search Results are here`), 2000);

searchOnGoogle();
console.log("Hello");
</code>
</codeblock>


In the example given above, even though `console.log("Hello")` comes after the invocation of `searchOnGoogle`, the messages are displayed in a different order.

This is because of the `setTimeout` in the `searchOnGoogle` function.
It starts a timer that runs in the background. After 2 seconds, it displays the message.
While the timer is running, `console.log("Hello")` is executed.

Such code that runs in the background
while the rest of the code is being executed
is called **asynchronous code**.
