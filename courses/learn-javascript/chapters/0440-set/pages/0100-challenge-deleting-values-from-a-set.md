Use the `delete()`
method to remove **"mango"**
from the `fruits` Set.

```js
Output:
Set(3) {'apple', 'banana', 'orange'}
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruits = new Set(["apple", "banana", "orange", "mango"]);
console.log(fruits);
</code>

<solution>
const fruits = new Set(["apple", "banana", "orange", "mango"]);
fruits.delete("mango");
console.log(fruits);
</solution>
</codeblock>
