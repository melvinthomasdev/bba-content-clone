The code given below results
in a `ReferenceError`.

Use `try...catch` to handle
the error in the code given below.

In the catch block, use `console.log`
to display the message `"Something went wrong"`.

```js
Output:
"Something went wrong"
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const firstName = "Sam";
console.log(lastName);
</code>

<solution>
try {
  const firstName = "Sam";
  console.log(lastName);
} catch {
  console.log("Something went wrong");
}
</solution>
</codeblock>
