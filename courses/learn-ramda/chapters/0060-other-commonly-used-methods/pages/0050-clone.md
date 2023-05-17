The `clone` function is used to deep copy an object or array.

It is different from the ES6 spread operator. Spreading only creates a shallow copy. In other words, if there are nested objects or arrays as values in the source object, their reference is copied to the new object while applying the spread operator.

It can be seen with an example.

```js
const obj = { a: 1, b: { c: 1 }, d: [1, 2] };

const newObj = { ...obj };

console.log(obj === newObj); // false
console.log(obj.b === newObj.b); // true
console.log(obj.d === newObj.d); // true
```

So, in this case, if we change `newObj.b.c`, `obj.b.c` changes as well. To make a deep copy we would need to do as follows:

```js
const newObj = {...obj, b: {...obj.b}, d: [...obj.d] };
console.log(obj === newObj); // false
console.log(obj.b === newObj.b); // false
console.log(obj.d === newObj.d); // false
```
In case the nesting goes deeper, the code starts becoming harder to read. With `clone` we can simply write as shown:

```js
const newObj = clone(obj); //=> much simpler than writing {...obj, b: { ...obj.b } }

console.log(obj === newObj); // false
console.log(obj.b === newObj.b); // false
console.log(obj.d === newObj.d); // false

console.log(equals(obj, newObj)); // true, because their contents are the same even if they are completely new objects.
```
