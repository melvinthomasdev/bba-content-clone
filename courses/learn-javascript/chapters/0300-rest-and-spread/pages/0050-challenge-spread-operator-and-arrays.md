Create an array `livingThings` by
combining  the `birds` and `insects` arrays
using the spread operator.
Add two other elements -
**"dog"**, and **"cat"**
to the end of the
`livingThings` array as well.

For example:
```js
Input:
birds = ["sparrow", "crow", "vulture"]
insects = ["crane fly", "beetle", "ant"]

Output: ["sparrow", "crow", "vulture", "crane fly", "beetle", "ant", "dog", "cat"]
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const birds = ["owl", "crow", "eagle"];
const insects = ["honeybee", "wasp", "ant"];
const livingThings = ;

console.log(livingThings);
</code>

<solution>
const birds = ["owl", "crow", "eagle"];
const insects = ["honeybee", "wasp", "ant"];
const livingThings = [...birds, ...insects, "dog", "cat"];

console.log(livingThings);
</solution>
</codeblock>
