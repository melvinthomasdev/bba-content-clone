Since we have placed the `setTimeout`
inside the `try {...}` block,
the given code does not
catch the error caused by -
`console.log(lastName)`.

Move the `try...catch` inside
the definition of the first argument of
`setTimeout` to show the error message.

```js
Output:
"Error!"
```

<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
try {
  setTimeout(() => {
    const firstName = "Sam";
    console.log(lastName);
  }, 1000);
} catch {
  console.log("Error!");
}
</code>

<solution>
setTimeout(() => {
  try {
    const firstName = "Sam";
    console.log(lastName);
  } catch {
    console.log("Error!");
  }
}, 1000);
</solution>
</codeblock>
