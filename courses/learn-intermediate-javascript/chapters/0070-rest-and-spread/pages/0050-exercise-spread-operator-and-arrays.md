Create an array `livingThings` by
combining  the `birds` and `insects` arrays
using the spread operator.
Add two other elements -
**"dog"**, and **"cat"**
to the end of the
`livingThings` array as well.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const birds = ["sparrow", "crow", "eagle"];
const insects = ["honeybee", "wasp", "ant"];
const livingThings = ;

console.log(livingThings);
</code>

<solution>
const birds = ["sparrow", "crow", "eagle"];
const insects = ["honeybee", "wasp", "ant"];
const livingThings = [...birds, ...insects, "dog", "cat"];

console.log(livingThings);
</solution>
</codeblock>