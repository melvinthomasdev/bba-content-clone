Check if the object stored
in the `bird1` variable is the same
as the one stored in
the `bird2` variable.

Use `console.log()` to
show the comparison.

Also, create another variable `bird3` whose value is equal to `bird1` when equality is checked.
Again, use `console.log()` to show the comparison.

```js
Output:
false
true
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird1 = { name: "Owl" };
const bird2 = { name: "Owl" };
console.log();
</code>

<solution>
const bird1 = { name: "Owl" };
const bird2 = { name: "Owl" };
console.log(bird1 === bird2);
const bird3 = bird1;
console.log(bird1 === bird3);
</solution>
</codeblock>
