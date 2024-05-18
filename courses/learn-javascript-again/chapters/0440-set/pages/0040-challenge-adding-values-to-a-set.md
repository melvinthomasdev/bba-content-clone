Use the `add()` method to add
`apple`, `banana` and `orange`
to the `fruits` set.

```js
Output:
Set(3) {'apple', 'banana', 'orange'}
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruits = new Set();
console.log(fruits);
</code>

<solution>
const fruits = new Set();

fruits.add("apple");
fruits.add("banana");
fruits.add("orange");

console.log(fruits);
</solution>
</codeblock>
