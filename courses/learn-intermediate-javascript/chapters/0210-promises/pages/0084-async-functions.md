Let's look at an example:

<codeblock language="javascript" type="lesson">
<code>
async function showGreeting() {
  return "Hello World";
}

console.log(showGreeting());
</code>
</codeblock>

When we append the `async` keyword to a function,
it automatically wraps the return value in a Promise.

<codeblock language="javascript" type="lesson">
<code>
async function showGreeting() {
  return "Hello World";
}

showGreeting().then( result => {
  console.log(result);
})
</code>
</codeblock>

We can use the `.then()` method to
handle the result.
