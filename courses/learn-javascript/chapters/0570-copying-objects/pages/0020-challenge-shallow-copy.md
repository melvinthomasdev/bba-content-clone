Create a **shallow copy** of `bird1`
and
assign it to `bird2` variable.

Assign **"Eagle"** to `bird2.name`.

Use `console.log()` to
show the value of the `bird1.name` property.

For example
```js
Input:
bird1 = { name: "Sparrow" };

Output:
"Eagle"
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird1 = { name: "Owl" };
const bird2 = ;

console.log(bird1.name);
</code>

<solution>
const bird1 = { name: "Owl" };
const bird2 = bird1;

bird2.name = "Eagle";

console.log(bird1.name);
</solution>
</codeblock>
