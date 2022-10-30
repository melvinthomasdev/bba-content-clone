Use the `clearInterval()` method
to cancel the loop started by
the `setInterval()` method.

<Editor type="exercise" lang="javascript" evaluateAsync="true">
<code>
function printGreeting() {
  console.log("Hello, I am Oliver!");
}

setInterval(printGreeting, 2000);
</code>

<solution>
function printGreeting() {
  console.log("Hello, I am Oliver!");
}

let identifier = setInterval(printGreeting, 2000);
clearInterval(identifier);
</solution>
</Editor>