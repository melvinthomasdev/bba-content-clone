Use the `setTimeout()` method to run the
`printGreeting` function after a
delay of 2 seconds.

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

setTimeout(printGreeting, 2000);
</solution>
</Editor>