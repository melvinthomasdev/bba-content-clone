The `keys` function returns all the top-level keys of the given object as an array. It does not return the keys of nested objects.
```js
keys({ elephants: 5, ants: 101, deer: 50 }); //=> ["elephants", "ants", "deer"]
keys({ elephants: 5, ants: 101, cats: { lions: 10, tigers: 20 } }); //=> ["elephants", "ants", "cats"]
```

The `values` function returns the top-level values of the given object as an array. It does not return the values of nested objects.

```js
values({ elephants: 5, ants: 101, deer: 50 }); //=> [5, 101, 50]
values({ elephants: 5, ants: 101, cats: { lions: 10, tigers: 20 } }); //=> [5, 101, { lions: 10, tigers: 20 }]
```
