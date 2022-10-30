We have created a timer using the
`setTimeout()` method. Use the `clearTimeout()`
method to cancel the timer.

<Editor type="exercise" lang="javascript" evaluateAsync="true">
<code>
function printGreeting() {
  console.log("Hello, I am Oliver!");
}

setTimeout(printGreeting, 2000);
</code>

<solution>
function printGreeting() {
  console.log("Hello, I am Oliver!");
}

let identifier = setTimeout(printGreeting, 2000);
clearTimeout(identifier);
</solution>
</Editor>