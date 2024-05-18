The code below displays **"Hello, World!"**
in the console.
Enclose the `console.log` statement
in a **while loop**,
such that it displays **"Hello, World!"**
`3` times.

```js
Output:
"Hello, World!"
"Hello, World!"
"Hello, World!"
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
console.log("Hello, World!");
</code>

<solution>
let iteration = 0;
while (iteration < 3) {
  console.log("Hello, World!");
  iteration++;
}
</solution>
</codeblock>
