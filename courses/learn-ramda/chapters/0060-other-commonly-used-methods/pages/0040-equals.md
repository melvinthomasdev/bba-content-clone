The `equals` function is used to check if two objects are deeply equal. It checks the given objects recursively and returns true only if all the primitive values in all levels of nesting match.

As we know, for objects, the equality check returns false if the reference is different. This can be confusing at times. `equals` in Ramda avoids this confusion as it checks only if the keys and values match.
```js
const x = { a: 1, b: { c: 1 } };
const y = { a: 1, b: { c: 1 } };
const a = { a: 1, b: { c: 2 } };
const z = x;

console.log(x === y); //=> false as the reference is different
console.log(equals(x, y)); //=> true as it checks only values and not reference

console.log(z === x); //=> true
console.log(equals(z, x)); //=> true

console.log(z === y); //=> false as the reference is different
console.log(equals(z, y)); //=> true as it checks only values and not reference

console.log(x === a); //=> false
console.log(equals(x, a)); //=> false as values are different
```
