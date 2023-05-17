Consider we have an object and we want to convert all the keys to upper case. How would we go about doing this?
```js
const obj = { a: 1, b: 2, c: 3 };
```

The `toPairs`function is used to create a list of key-value pairs from an object.
```js
const pairs = toPairs(obj); //=> [["a", 1], ["b", 2], ["c", 3]]
const upperCasedPairs = map(([key, value]) => [toUpper(key), value], pairs); //=> [["A", 1], ["B", 2], ["C", 3]]
```

Now to convert this back to an object we can use the `fromPairs` function. It is used to create an object from a list of key-value pairs. If a key appears in multiple pairs, then the rightmost pair is included in the object.
```js
const upperCasedObject = fromPairs(upperCasedPairs); //=> { A: 1, B: 2, C: 3 }

// If duplicate keys are present, the right-most is taken
fromPairs([['a', 1], ['b', 2], ['c', 3], ['b', 10]]); //=> //=> { a: 1, b: 10, c: 3 }
```
We can pass this all to a `pipe` function to create a reusable function as shown:
```js
const upperCaseObjectKeys = pipe(
  toPairs,
  map(([key, value]) => [toUpper(key), value]),
  fromPairs
);
upperCaseObjectKeys(obj); //=> { A: 1, B: 2, C: 3 }
```
