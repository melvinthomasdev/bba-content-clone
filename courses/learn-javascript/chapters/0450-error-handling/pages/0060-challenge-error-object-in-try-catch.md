The `try {...}` block in the given code
contains an error.

Show the name of the error
using `console.log`
inside the `catch` block.

```js
Output:
"TypeError"
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
try {
  const num = 12;
  num = 13;
} catch {
  console.log();
}
</code>

<solution>
try {
  const num = 12;
  num = 13;
} catch (err) {
  console.log(err.name);
}
</solution>
</codeblock>
```
