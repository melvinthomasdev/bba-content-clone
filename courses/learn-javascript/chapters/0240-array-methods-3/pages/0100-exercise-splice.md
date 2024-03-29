Use the `splice()` method
to replace the element **"Oliver"**
with **"Eve"**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const names = ["Adam", "Oliver", "Sam"];
console.log(names);
</code>

<solution>
const names = ["Adam", "Oliver", "Sam"];
names.splice(1, 1, "Eve");;
console.log(names);
</solution>
</codeblock>