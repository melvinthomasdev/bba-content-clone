Use the `clear()` method
to remove all the elements
from the `fruits` set.

```js
Input: fruits = new Set(["apple", "banana", "orange", "mango"])

Output:
Set(0) {size: 0}
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruits = new Set(["apple", "banana", "orange", "mango"]);

console.log(fruits);
</code>

<solution>
const fruits = new Set(["apple", "banana", "orange", "mango"]);
fruits.clear();
console.log(fruits);
</solution>
</codeblock>
