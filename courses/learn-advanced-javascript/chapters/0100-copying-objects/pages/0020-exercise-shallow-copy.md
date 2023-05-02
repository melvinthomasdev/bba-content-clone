Create a **shallow copy** of `bird1`
and
assign it to `bird2` variable.

Assign **"Eagle"** to `bird2.name`.

Use `console.log()` to
show the value of the `bird1.name` property.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird1 = { name: "Sparrow" };
const bird2 = ;

console.log(bird1.name);
</code>

<solution>
const bird1 = { name: "Sparrow" };
const bird2 = bird1;

bird2.name = "Eagle";

console.log(bird1.name);
</solution>
</codeblock>