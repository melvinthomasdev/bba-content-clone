Use the `setInterval()` method
to run the `printGreeting()`
function after every 2 seconds.

<Editor type="exercise" lang="javascript" evaluateAsync="true">
<code>
function printGreeting() {
  console.log("Hello, I am Oliver!");
}
</code>

<solution>
function printGreeting() {
  console.log("Hello, I am Oliver!");
}

setInterval(printGreeting, 2000);
</solution>
</Editor>